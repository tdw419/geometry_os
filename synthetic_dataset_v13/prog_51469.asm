; DESCRIPTION: Composite: Places a red dot at position (296, 136) then Places a blue line segment connecting (426, 98) to (81, 166) then Places a yellow circle of radius 71 at center (344, 92).
; PLAN: r0=296(x), r1=136(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=426(x1), r6=98(y1), r7=81(x2), r8=166(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=344(x), r11=92(y), r12=71(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 296
LDI r1, 136
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 426
LDI r6, 98
LDI r7, 81
LDI r8, 166
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 344
LDI r11, 92
LDI r12, 71
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
