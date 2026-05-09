; DESCRIPTION: Composite: Creates a orange rectangular region at (171, 169) spanning 48 by 44 pixels then Places a black dot at position (209, 221).
; PLAN: r0=171(x), r1=169(y), r2=48(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=209(x), r6=221(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 171
LDI r1, 169
LDI r2, 48
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 209
LDI r6, 221
LDI r7, 0x000000
PSET r5, r6, r7
HALT
