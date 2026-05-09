; DESCRIPTION: Composite: Places a cyan dot at position (495, 81) then Places a red line segment connecting (468, 64) to (196, 15) then Creates a white circular shape at (297, 69) with radius 43.
; PLAN: r0=495(x), r1=81(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=468(x1), r6=64(y1), r7=196(x2), r8=15(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=297(x), r11=69(y), r12=43(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 495
LDI r1, 81
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 468
LDI r6, 64
LDI r7, 196
LDI r8, 15
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 297
LDI r11, 69
LDI r12, 43
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
