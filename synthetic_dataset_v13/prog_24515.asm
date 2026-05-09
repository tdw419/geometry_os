; DESCRIPTION: Composite: Places a magenta line segment connecting (404, 250) to (360, 223) then Draws a white rectangle at (260, 194) with width 22 and height 12.
; PLAN: r0=404(x1), r1=250(y1), r2=360(x2), r3=223(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=260(x), r6=194(y), r7=22(width), r8=12(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 404
LDI r1, 250
LDI r2, 360
LDI r3, 223
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 260
LDI r6, 194
LDI r7, 22
LDI r8, 12
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
