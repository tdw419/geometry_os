; DESCRIPTION: Composite: Renders a blue line between points (264, 223) and (73, 216) then Draws a green rectangle at (303, 27) with width 104 and height 58.
; PLAN: r0=264(x1), r1=223(y1), r2=73(x2), r3=216(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=303(x), r6=27(y), r7=104(width), r8=58(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 264
LDI r1, 223
LDI r2, 73
LDI r3, 216
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 303
LDI r6, 27
LDI r7, 104
LDI r8, 58
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
