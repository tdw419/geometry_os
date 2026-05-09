; DESCRIPTION: Renders a blue line between points (445, 8) and (326, 188).
; PLAN: r0=445(x1), r1=8(y1), r2=326(x2), r3=188(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 8
LDI r2, 326
LDI r3, 188
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
