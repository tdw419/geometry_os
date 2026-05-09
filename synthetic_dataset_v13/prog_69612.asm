; DESCRIPTION: Draws a green line from (36, 17) to (109, 231).
; PLAN: r0=36(x1), r1=17(y1), r2=109(x2), r3=231(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 17
LDI r2, 109
LDI r3, 231
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
