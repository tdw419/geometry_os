; DESCRIPTION: Renders a yellow box of size 49x75 starting at (373, 154).
; PLAN: r0=373(x), r1=154(y), r2=49(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 154
LDI r2, 49
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
