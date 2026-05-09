; DESCRIPTION: Renders a green line between points (484, 191) and (128, 253).
; PLAN: r0=484(x1), r1=191(y1), r2=128(x2), r3=253(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 484
LDI r1, 191
LDI r2, 128
LDI r3, 253
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
