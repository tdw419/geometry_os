; DESCRIPTION: Draws a yellow line from (237, 176) to (393, 99).
; PLAN: r0=237(x1), r1=176(y1), r2=393(x2), r3=99(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 176
LDI r2, 393
LDI r3, 99
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
