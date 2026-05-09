; DESCRIPTION: Places a yellow circle of radius 10 at center (74, 154).
; PLAN: r0=74(x), r1=154(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 154
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
