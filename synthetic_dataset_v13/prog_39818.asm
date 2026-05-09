; DESCRIPTION: Composite: Renders a blue line between points (440, 42) and (385, 35) then Draws a orange circle centered at (17, 111) with radius 12.
; PLAN: r0=440(x1), r1=42(y1), r2=385(x2), r3=35(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=17(x), r6=111(y), r7=12(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 440
LDI r1, 42
LDI r2, 385
LDI r3, 35
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 17
LDI r6, 111
LDI r7, 12
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
