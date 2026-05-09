; DESCRIPTION: Composite: Places a black dot at position (196, 179) then Creates a green rectangular region at (239, 39) spanning 101 by 110 pixels.
; PLAN: r0=196(x), r1=179(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=239(x), r6=39(y), r7=101(width), r8=110(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 196
LDI r1, 179
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 239
LDI r6, 39
LDI r7, 101
LDI r8, 110
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
