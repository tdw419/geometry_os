; DESCRIPTION: Places a green line segment connecting (242, 142) to (254, 93).
; PLAN: r0=242(x1), r1=142(y1), r2=254(x2), r3=93(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 142
LDI r2, 254
LDI r3, 93
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
