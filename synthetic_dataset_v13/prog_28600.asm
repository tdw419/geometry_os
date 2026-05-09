; DESCRIPTION: Renders a green line between points (126, 234) and (237, 11).
; PLAN: r0=126(x1), r1=234(y1), r2=237(x2), r3=11(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 234
LDI r2, 237
LDI r3, 11
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
