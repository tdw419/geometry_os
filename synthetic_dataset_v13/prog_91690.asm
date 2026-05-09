; DESCRIPTION: Renders a green line between points (237, 92) and (329, 189).
; PLAN: r0=237(x1), r1=92(y1), r2=329(x2), r3=189(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 92
LDI r2, 329
LDI r3, 189
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
