; DESCRIPTION: Places a yellow circle of radius 63 at center (328, 154).
; PLAN: r0=328(x), r1=154(y), r2=63(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 328
LDI r1, 154
LDI r2, 63
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
