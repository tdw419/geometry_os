; DESCRIPTION: Composite: Creates a yellow rectangular region at (230, 109) spanning 41 by 48 pixels then Sets a single red pixel at (269, 207).
; PLAN: r0=230(x), r1=109(y), r2=41(width), r3=48(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=269(x), r6=207(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 230
LDI r1, 109
LDI r2, 41
LDI r3, 48
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 269
LDI r6, 207
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
