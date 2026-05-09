; DESCRIPTION: Renders a white line between points (63, 27) and (318, 8).
; PLAN: r0=63(x1), r1=27(y1), r2=318(x2), r3=8(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 27
LDI r2, 318
LDI r3, 8
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
