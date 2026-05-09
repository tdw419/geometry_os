; DESCRIPTION: Renders a cyan line between points (65, 217) and (389, 222).
; PLAN: r0=65(x1), r1=217(y1), r2=389(x2), r3=222(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 217
LDI r2, 389
LDI r3, 222
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
