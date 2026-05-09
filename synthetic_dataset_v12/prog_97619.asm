; DESCRIPTION: Places a blue line segment connecting (298, 65) to (211, 223).
; PLAN: r0=298(x1), r1=65(y1), r2=211(x2), r3=223(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 65
LDI r2, 211
LDI r3, 223
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
