; DESCRIPTION: Renders a white line between points (133, 245) and (499, 226).
; PLAN: r0=133(x1), r1=245(y1), r2=499(x2), r3=226(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 245
LDI r2, 499
LDI r3, 226
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
