; DESCRIPTION: Composite: Draws a blue rectangle at (442, 88) with width 57 and height 112 then Renders a white line between points (492, 243) and (124, 165) then Sets a single blue pixel at (47, 165).
; PLAN: r0=442(x), r1=88(y), r2=57(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=492(x1), r6=243(y1), r7=124(x2), r8=165(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=47(x), r11=165(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 442
LDI r1, 88
LDI r2, 57
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 492
LDI r6, 243
LDI r7, 124
LDI r8, 165
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 47
LDI r11, 165
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
