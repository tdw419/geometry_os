; DESCRIPTION: Draws a green line from (136, 243) to (124, 68).
; PLAN: r0=136(x1), r1=243(y1), r2=124(x2), r3=68(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 243
LDI r2, 124
LDI r3, 68
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
