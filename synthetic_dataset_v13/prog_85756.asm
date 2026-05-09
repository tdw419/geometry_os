; DESCRIPTION: Places a green line segment connecting (502, 222) to (119, 19).
; PLAN: r0=502(x1), r1=222(y1), r2=119(x2), r3=19(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 222
LDI r2, 119
LDI r3, 19
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
