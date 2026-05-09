; DESCRIPTION: Renders a green line between points (112, 37) and (414, 236).
; PLAN: r0=112(x1), r1=37(y1), r2=414(x2), r3=236(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 37
LDI r2, 414
LDI r3, 236
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
