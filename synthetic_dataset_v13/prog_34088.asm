; DESCRIPTION: Renders a black line between points (168, 147) and (268, 13).
; PLAN: r0=168(x1), r1=147(y1), r2=268(x2), r3=13(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 147
LDI r2, 268
LDI r3, 13
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
