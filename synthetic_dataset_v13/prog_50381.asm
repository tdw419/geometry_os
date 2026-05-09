; DESCRIPTION: Renders a blue line between points (380, 226) and (1, 117).
; PLAN: r0=380(x1), r1=226(y1), r2=1(x2), r3=117(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 226
LDI r2, 1
LDI r3, 117
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
