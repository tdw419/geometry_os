; DESCRIPTION: Places a green line segment connecting (63, 229) to (226, 24).
; PLAN: r0=63(x1), r1=229(y1), r2=226(x2), r3=24(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 229
LDI r2, 226
LDI r3, 24
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
