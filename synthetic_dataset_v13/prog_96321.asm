; DESCRIPTION: Renders a green line between points (197, 123) and (213, 112).
; PLAN: r0=197(x1), r1=123(y1), r2=213(x2), r3=112(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 123
LDI r2, 213
LDI r3, 112
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
