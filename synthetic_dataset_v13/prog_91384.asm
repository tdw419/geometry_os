; DESCRIPTION: Places a magenta circle of radius 34 at center (67, 154).
; PLAN: r0=67(x), r1=154(y), r2=34(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 67
LDI r1, 154
LDI r2, 34
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
HALT
