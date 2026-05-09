; DESCRIPTION: Renders a purple line between points (425, 205) and (196, 94).
; PLAN: r0=425(x1), r1=205(y1), r2=196(x2), r3=94(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 205
LDI r2, 196
LDI r3, 94
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
