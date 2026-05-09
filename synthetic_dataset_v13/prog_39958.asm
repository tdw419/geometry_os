; DESCRIPTION: Places a green circle of radius 67 at center (74, 154).
; PLAN: r0=74(x), r1=154(y), r2=67(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 154
LDI r2, 67
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
