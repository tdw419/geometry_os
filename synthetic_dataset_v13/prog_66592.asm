; DESCRIPTION: Places a blue circle of radius 23 at center (283, 154).
; PLAN: r0=283(x), r1=154(y), r2=23(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 283
LDI r1, 154
LDI r2, 23
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
