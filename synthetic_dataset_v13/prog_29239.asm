; DESCRIPTION: Renders a yellow line between points (258, 126) and (51, 103).
; PLAN: r0=258(x1), r1=126(y1), r2=51(x2), r3=103(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 258
LDI r1, 126
LDI r2, 51
LDI r3, 103
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
