; DESCRIPTION: Renders a green line between points (63, 155) and (243, 202).
; PLAN: r0=63(x1), r1=155(y1), r2=243(x2), r3=202(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 155
LDI r2, 243
LDI r3, 202
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
