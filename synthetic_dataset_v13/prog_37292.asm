; DESCRIPTION: Renders a yellow line between points (309, 150) and (414, 234).
; PLAN: r0=309(x1), r1=150(y1), r2=414(x2), r3=234(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 150
LDI r2, 414
LDI r3, 234
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
