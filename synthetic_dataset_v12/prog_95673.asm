; DESCRIPTION: Places a yellow circle of radius 79 at center (84, 154).
; PLAN: r0=84(x), r1=154(y), r2=79(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 84
LDI r1, 154
LDI r2, 79
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
