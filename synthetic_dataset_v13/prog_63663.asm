; DESCRIPTION: Composite: Renders a magenta line between points (160, 223) and (287, 70) then Draws a magenta rectangle at (336, 16) with width 11 and height 68.
; PLAN: r0=160(x1), r1=223(y1), r2=287(x2), r3=70(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=336(x), r6=16(y), r7=11(width), r8=68(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 160
LDI r1, 223
LDI r2, 287
LDI r3, 70
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 336
LDI r6, 16
LDI r7, 11
LDI r8, 68
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
