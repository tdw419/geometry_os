; DESCRIPTION: Places a green line segment connecting (119, 254) to (298, 76).
; PLAN: r0=119(x1), r1=254(y1), r2=298(x2), r3=76(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 254
LDI r2, 298
LDI r3, 76
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
