; DESCRIPTION: Renders a green line between points (263, 132) and (318, 184).
; PLAN: r0=263(x1), r1=132(y1), r2=318(x2), r3=184(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 132
LDI r2, 318
LDI r3, 184
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
