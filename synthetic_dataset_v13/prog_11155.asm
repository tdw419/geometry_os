; DESCRIPTION: Renders a purple line between points (289, 63) and (392, 124).
; PLAN: r0=289(x1), r1=63(y1), r2=392(x2), r3=124(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 63
LDI r2, 392
LDI r3, 124
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
