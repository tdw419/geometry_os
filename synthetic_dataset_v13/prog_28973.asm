; DESCRIPTION: Composite: Renders a magenta line between points (229, 145) and (363, 204) then Draws a blue rectangle at (446, 35) with width 54 and height 66.
; PLAN: r0=229(x1), r1=145(y1), r2=363(x2), r3=204(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=446(x), r6=35(y), r7=54(width), r8=66(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 229
LDI r1, 145
LDI r2, 363
LDI r3, 204
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 446
LDI r6, 35
LDI r7, 54
LDI r8, 66
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
