; DESCRIPTION: Draws a yellow line from (414, 133) to (319, 76).
; PLAN: r0=414(x1), r1=133(y1), r2=319(x2), r3=76(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 133
LDI r2, 319
LDI r3, 76
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
