; DESCRIPTION: Places a blue line segment connecting (159, 243) to (309, 242).
; PLAN: r0=159(x1), r1=243(y1), r2=309(x2), r3=242(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 243
LDI r2, 309
LDI r3, 242
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
