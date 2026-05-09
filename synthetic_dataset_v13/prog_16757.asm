; DESCRIPTION: Renders a magenta line between points (427, 197) and (34, 29).
; PLAN: r0=427(x1), r1=197(y1), r2=34(x2), r3=29(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 427
LDI r1, 197
LDI r2, 34
LDI r3, 29
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
