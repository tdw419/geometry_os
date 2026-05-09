; DESCRIPTION: Renders a blue line between points (243, 109) and (290, 157).
; PLAN: r0=243(x1), r1=109(y1), r2=290(x2), r3=157(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 109
LDI r2, 290
LDI r3, 157
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
