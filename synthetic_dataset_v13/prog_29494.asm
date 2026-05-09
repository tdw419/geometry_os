; DESCRIPTION: Renders a blue line between points (309, 243) and (90, 182).
; PLAN: r0=309(x1), r1=243(y1), r2=90(x2), r3=182(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 309
LDI r1, 243
LDI r2, 90
LDI r3, 182
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
