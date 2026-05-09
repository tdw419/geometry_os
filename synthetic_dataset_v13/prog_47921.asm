; DESCRIPTION: Composite: Places a blue 37x36 rectangle at position (351, 160) then Renders a magenta line between points (23, 2) and (498, 69).
; PLAN: r0=351(x), r1=160(y), r2=37(width), r3=36(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=23(x1), r6=2(y1), r7=498(x2), r8=69(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 351
LDI r1, 160
LDI r2, 37
LDI r3, 36
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 23
LDI r6, 2
LDI r7, 498
LDI r8, 69
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
