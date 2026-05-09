; DESCRIPTION: Draws a green line from (148, 126) to (84, 248).
; PLAN: r0=148(x1), r1=126(y1), r2=84(x2), r3=248(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 126
LDI r2, 84
LDI r3, 248
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
