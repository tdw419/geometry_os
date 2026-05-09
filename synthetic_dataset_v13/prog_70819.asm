; DESCRIPTION: Composite: Draws a blue line from (195, 12) to (47, 130) then Draws a red rectangle at (268, 109) with width 22 and height 54.
; PLAN: r0=195(x1), r1=12(y1), r2=47(x2), r3=130(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=268(x), r6=109(y), r7=22(width), r8=54(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 195
LDI r1, 12
LDI r2, 47
LDI r3, 130
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 268
LDI r6, 109
LDI r7, 22
LDI r8, 54
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
