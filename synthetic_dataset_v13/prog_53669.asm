; DESCRIPTION: Composite: Places a red 115x40 rectangle at position (165, 82) then Renders a orange line between points (141, 216) and (434, 136) then Places a magenta circle of radius 14 at center (387, 174).
; PLAN: r0=165(x), r1=82(y), r2=115(width), r3=40(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=141(x1), r6=216(y1), r7=434(x2), r8=136(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=387(x), r11=174(y), r12=14(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 165
LDI r1, 82
LDI r2, 115
LDI r3, 40
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 141
LDI r6, 216
LDI r7, 434
LDI r8, 136
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 387
LDI r11, 174
LDI r12, 14
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
