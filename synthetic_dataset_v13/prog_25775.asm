; DESCRIPTION: Renders a yellow disk with center (162, 31) and radius 16.
; PLAN: r0=162(x), r1=31(y), r2=16(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 31
LDI r2, 16
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
