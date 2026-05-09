; DESCRIPTION: Draws a green line from (326, 78) to (181, 248).
; PLAN: r0=326(x1), r1=78(y1), r2=181(x2), r3=248(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 78
LDI r2, 181
LDI r3, 248
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
