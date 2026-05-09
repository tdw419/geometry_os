; DESCRIPTION: Composite: Draws a blue rectangle at (203, 74) with width 54 and height 71 then Places a yellow line segment connecting (227, 205) to (290, 181).
; PLAN: r0=203(x), r1=74(y), r2=54(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=227(x1), r6=205(y1), r7=290(x2), r8=181(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 203
LDI r1, 74
LDI r2, 54
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 205
LDI r7, 290
LDI r8, 181
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
