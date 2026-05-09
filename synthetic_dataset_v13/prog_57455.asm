; DESCRIPTION: Composite: Places a orange dot at position (377, 214) then Places a cyan circle of radius 40 at center (358, 158) then Draws a white line from (328, 30) to (343, 151).
; PLAN: r0=377(x), r1=214(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=358(x), r6=158(y), r7=40(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=328(x1), r11=30(y1), r12=343(x2), r13=151(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 377
LDI r1, 214
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 358
LDI r6, 158
LDI r7, 40
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 328
LDI r11, 30
LDI r12, 343
LDI r13, 151
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
