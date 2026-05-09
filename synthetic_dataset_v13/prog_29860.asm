; DESCRIPTION: Renders a cyan line between points (133, 160) and (136, 253).
; PLAN: r0=133(x1), r1=160(y1), r2=136(x2), r3=253(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 160
LDI r2, 136
LDI r3, 253
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
