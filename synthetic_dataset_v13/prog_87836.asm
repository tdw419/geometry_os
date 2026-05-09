; DESCRIPTION: Renders a purple line between points (268, 109) and (243, 187).
; PLAN: r0=268(x1), r1=109(y1), r2=243(x2), r3=187(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 109
LDI r2, 243
LDI r3, 187
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
