; DESCRIPTION: Places a green circle of radius 70 at center (162, 95).
; PLAN: r0=162(x), r1=95(y), r2=70(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 95
LDI r2, 70
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
