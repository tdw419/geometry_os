; DESCRIPTION: Composite: Renders a magenta box of size 18x15 starting at (474, 185) then Places a white line segment connecting (69, 176) to (43, 91).
; PLAN: r0=474(x), r1=185(y), r2=18(width), r3=15(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=69(x1), r6=176(y1), r7=43(x2), r8=91(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 474
LDI r1, 185
LDI r2, 18
LDI r3, 15
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 69
LDI r6, 176
LDI r7, 43
LDI r8, 91
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
