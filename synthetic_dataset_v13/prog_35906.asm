; DESCRIPTION: Places a green circle of radius 68 at center (288, 76).
; PLAN: r0=288(x), r1=76(y), r2=68(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 288
LDI r1, 76
LDI r2, 68
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
