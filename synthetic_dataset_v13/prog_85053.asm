; DESCRIPTION: Places a blue line segment connecting (283, 221) to (283, 91).
; PLAN: r0=283(x1), r1=221(y1), r2=283(x2), r3=91(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 221
LDI r2, 283
LDI r3, 91
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
