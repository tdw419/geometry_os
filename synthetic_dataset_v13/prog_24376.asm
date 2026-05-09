; DESCRIPTION: Draws a yellow line from (50, 170) to (257, 254).
; PLAN: r0=50(x1), r1=170(y1), r2=257(x2), r3=254(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 170
LDI r2, 257
LDI r3, 254
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
