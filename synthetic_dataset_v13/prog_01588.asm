; DESCRIPTION: Composite: Draws a blue rectangle at (319, 127) with width 45 and height 36 then Renders a magenta line between points (372, 63) and (407, 38).
; PLAN: r0=319(x), r1=127(y), r2=45(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=372(x1), r6=63(y1), r7=407(x2), r8=38(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 319
LDI r1, 127
LDI r2, 45
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 372
LDI r6, 63
LDI r7, 407
LDI r8, 38
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
