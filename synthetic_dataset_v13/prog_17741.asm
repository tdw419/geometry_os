; DESCRIPTION: Renders a green line between points (210, 132) and (265, 233).
; PLAN: r0=210(x1), r1=132(y1), r2=265(x2), r3=233(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 132
LDI r2, 265
LDI r3, 233
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
