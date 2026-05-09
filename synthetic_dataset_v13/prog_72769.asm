; DESCRIPTION: Renders a green line between points (206, 147) and (61, 63).
; PLAN: r0=206(x1), r1=147(y1), r2=61(x2), r3=63(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 206
LDI r1, 147
LDI r2, 61
LDI r3, 63
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
