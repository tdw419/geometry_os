; DESCRIPTION: Composite: Sets a single cyan pixel at (24, 116) then Draws a blue line from (339, 88) to (74, 174) then Draws a white circle centered at (356, 82) with radius 29.
; PLAN: r0=24(x), r1=116(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=339(x1), r6=88(y1), r7=74(x2), r8=174(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=356(x), r11=82(y), r12=29(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 24
LDI r1, 116
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 339
LDI r6, 88
LDI r7, 74
LDI r8, 174
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 356
LDI r11, 82
LDI r12, 29
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
