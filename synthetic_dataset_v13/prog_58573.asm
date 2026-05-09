; DESCRIPTION: Composite: Draws a red rectangle at (365, 82) with width 38 and height 20 then Renders a magenta line between points (151, 159) and (185, 53) then Renders a magenta disk with center (100, 113) and radius 79.
; PLAN: r0=365(x), r1=82(y), r2=38(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=151(x1), r6=159(y1), r7=185(x2), r8=53(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=100(x), r11=113(y), r12=79(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 365
LDI r1, 82
LDI r2, 38
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 151
LDI r6, 159
LDI r7, 185
LDI r8, 53
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 100
LDI r11, 113
LDI r12, 79
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
