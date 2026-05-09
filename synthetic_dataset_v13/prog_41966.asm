; DESCRIPTION: Renders a purple line between points (196, 210) and (382, 61).
; PLAN: r0=196(x1), r1=210(y1), r2=382(x2), r3=61(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 210
LDI r2, 382
LDI r3, 61
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
