; DESCRIPTION: Composite: Renders a black line between points (190, 17) and (280, 130) then Draws a blue rectangle at (392, 124) with width 12 and height 113.
; PLAN: r0=190(x1), r1=17(y1), r2=280(x2), r3=130(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=392(x), r6=124(y), r7=12(width), r8=113(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 190
LDI r1, 17
LDI r2, 280
LDI r3, 130
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 392
LDI r6, 124
LDI r7, 12
LDI r8, 113
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
