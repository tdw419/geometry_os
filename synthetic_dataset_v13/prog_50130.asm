; DESCRIPTION: Composite: Draws a black rectangle at (350, 85) with width 10 and height 109 then Places a green line segment connecting (125, 100) to (211, 255).
; PLAN: r0=350(x), r1=85(y), r2=10(width), r3=109(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=125(x1), r6=100(y1), r7=211(x2), r8=255(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 350
LDI r1, 85
LDI r2, 10
LDI r3, 109
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 125
LDI r6, 100
LDI r7, 211
LDI r8, 255
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
