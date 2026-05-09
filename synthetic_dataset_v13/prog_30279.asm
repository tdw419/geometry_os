; DESCRIPTION: Composite: Places a black dot at position (260, 249) then Creates a yellow rectangular region at (339, 24) spanning 79 by 34 pixels.
; PLAN: r0=260(x), r1=249(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=339(x), r6=24(y), r7=79(width), r8=34(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 260
LDI r1, 249
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 339
LDI r6, 24
LDI r7, 79
LDI r8, 34
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
