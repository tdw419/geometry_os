; DESCRIPTION: Renders a yellow line between points (237, 126) and (172, 208).
; PLAN: r0=237(x1), r1=126(y1), r2=172(x2), r3=208(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 126
LDI r2, 172
LDI r3, 208
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
