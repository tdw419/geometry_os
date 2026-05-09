; DESCRIPTION: Composite: Places a magenta line segment connecting (26, 87) to (14, 183) then Renders a green box of size 65x108 starting at (17, 44).
; PLAN: r0=26(x1), r1=87(y1), r2=14(x2), r3=183(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=17(x), r6=44(y), r7=65(width), r8=108(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 26
LDI r1, 87
LDI r2, 14
LDI r3, 183
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 17
LDI r6, 44
LDI r7, 65
LDI r8, 108
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
HALT
