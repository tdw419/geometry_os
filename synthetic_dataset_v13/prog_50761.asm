; DESCRIPTION: Renders a blue line between points (326, 205) and (127, 81).
; PLAN: r0=326(x1), r1=205(y1), r2=127(x2), r3=81(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 205
LDI r2, 127
LDI r3, 81
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
