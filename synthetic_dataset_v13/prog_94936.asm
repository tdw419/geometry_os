; DESCRIPTION: Composite: Renders a black line between points (31, 121) and (332, 51) then Places a magenta 83x88 rectangle at position (420, 167) then Places a red dot at position (397, 162).
; PLAN: r0=31(x1), r1=121(y1), r2=332(x2), r3=51(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=420(x), r6=167(y), r7=83(width), r8=88(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=397(x), r11=162(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 31
LDI r1, 121
LDI r2, 332
LDI r3, 51
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 420
LDI r6, 167
LDI r7, 83
LDI r8, 88
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 397
LDI r11, 162
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
