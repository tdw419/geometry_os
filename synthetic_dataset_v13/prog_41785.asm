; DESCRIPTION: Renders a white line between points (119, 132) and (241, 210).
; PLAN: r0=119(x1), r1=132(y1), r2=241(x2), r3=210(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 132
LDI r2, 241
LDI r3, 210
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
