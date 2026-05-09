; DESCRIPTION: Renders a blue line between points (261, 176) and (231, 253).
; PLAN: r0=261(x1), r1=176(y1), r2=231(x2), r3=253(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 176
LDI r2, 231
LDI r3, 253
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
