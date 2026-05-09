; DESCRIPTION: Renders a purple line between points (220, 253) and (465, 241).
; PLAN: r0=220(x1), r1=253(y1), r2=465(x2), r3=241(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 253
LDI r2, 465
LDI r3, 241
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
