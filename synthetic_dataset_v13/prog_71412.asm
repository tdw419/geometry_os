; DESCRIPTION: Renders a green line between points (237, 193) and (165, 102).
; PLAN: r0=237(x1), r1=193(y1), r2=165(x2), r3=102(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 193
LDI r2, 165
LDI r3, 102
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
