; DESCRIPTION: Renders a purple line between points (46, 220) and (293, 27).
; PLAN: r0=46(x1), r1=220(y1), r2=293(x2), r3=27(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 220
LDI r2, 293
LDI r3, 27
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
