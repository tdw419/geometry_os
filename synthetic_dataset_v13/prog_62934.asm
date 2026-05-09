; DESCRIPTION: Composite: Draws a purple rectangle at (328, 149) with width 20 and height 72 then Places a black line segment connecting (486, 130) to (298, 175).
; PLAN: r0=328(x), r1=149(y), r2=20(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=486(x1), r6=130(y1), r7=298(x2), r8=175(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 328
LDI r1, 149
LDI r2, 20
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 486
LDI r6, 130
LDI r7, 298
LDI r8, 175
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
