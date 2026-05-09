; DESCRIPTION: Renders a green line between points (60, 253) and (451, 27).
; PLAN: r0=60(x1), r1=253(y1), r2=451(x2), r3=27(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 253
LDI r2, 451
LDI r3, 27
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
