; DESCRIPTION: Renders a blue line between points (139, 236) and (208, 128).
; PLAN: r0=139(x1), r1=236(y1), r2=208(x2), r3=128(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 236
LDI r2, 208
LDI r3, 128
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
