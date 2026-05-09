; DESCRIPTION: Renders a yellow line between points (234, 208) and (109, 141).
; PLAN: r0=234(x1), r1=208(y1), r2=109(x2), r3=141(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 208
LDI r2, 109
LDI r3, 141
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
