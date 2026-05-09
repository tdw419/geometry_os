; DESCRIPTION: Places a yellow line segment connecting (409, 243) to (240, 95).
; PLAN: r0=409(x1), r1=243(y1), r2=240(x2), r3=95(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 243
LDI r2, 240
LDI r3, 95
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
