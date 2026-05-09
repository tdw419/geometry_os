; DESCRIPTION: Renders a green line between points (130, 213) and (142, 208).
; PLAN: r0=130(x1), r1=213(y1), r2=142(x2), r3=208(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 213
LDI r2, 142
LDI r3, 208
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
