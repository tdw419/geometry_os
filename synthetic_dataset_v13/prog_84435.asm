; DESCRIPTION: Composite: Renders a yellow disk with center (406, 63) and radius 45 then Draws a purple line from (122, 42) to (94, 50).
; PLAN: r0=406(x), r1=63(y), r2=45(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=122(x1), r6=42(y1), r7=94(x2), r8=50(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 406
LDI r1, 63
LDI r2, 45
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 122
LDI r6, 42
LDI r7, 94
LDI r8, 50
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
