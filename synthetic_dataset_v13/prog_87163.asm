; DESCRIPTION: Composite: Places a black dot at position (416, 179) then Creates a yellow rectangular region at (260, 15) spanning 17 by 99 pixels.
; PLAN: r0=416(x), r1=179(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=260(x), r6=15(y), r7=17(width), r8=99(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 416
LDI r1, 179
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 260
LDI r6, 15
LDI r7, 17
LDI r8, 99
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
