; DESCRIPTION: Renders a black line between points (299, 176) and (471, 128).
; PLAN: r0=299(x1), r1=176(y1), r2=471(x2), r3=128(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 299
LDI r1, 176
LDI r2, 471
LDI r3, 128
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
