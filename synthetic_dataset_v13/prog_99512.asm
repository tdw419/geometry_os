; DESCRIPTION: Composite: Renders a cyan line between points (146, 3) and (74, 130) then Draws a blue rectangle at (334, 152) with width 55 and height 88.
; PLAN: r0=146(x1), r1=3(y1), r2=74(x2), r3=130(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=334(x), r6=152(y), r7=55(width), r8=88(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 146
LDI r1, 3
LDI r2, 74
LDI r3, 130
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 334
LDI r6, 152
LDI r7, 55
LDI r8, 88
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
