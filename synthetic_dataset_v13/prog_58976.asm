; DESCRIPTION: Places a yellow line segment connecting (125, 120) to (275, 254).
; PLAN: r0=125(x1), r1=120(y1), r2=275(x2), r3=254(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 120
LDI r2, 275
LDI r3, 254
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
