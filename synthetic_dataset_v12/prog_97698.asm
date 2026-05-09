; DESCRIPTION: Places a green line segment connecting (63, 234) to (126, 180).
; PLAN: r0=63(x1), r1=234(y1), r2=126(x2), r3=180(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 234
LDI r2, 126
LDI r3, 180
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
