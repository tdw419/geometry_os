; DESCRIPTION: Composite: Renders a blue disk with center (89, 113) and radius 46 then Draws a black rectangle at (146, 7) with width 55 and height 77.
; PLAN: r0=89(x), r1=113(y), r2=46(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=146(x), r6=7(y), r7=55(width), r8=77(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 89
LDI r1, 113
LDI r2, 46
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 146
LDI r6, 7
LDI r7, 55
LDI r8, 77
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
