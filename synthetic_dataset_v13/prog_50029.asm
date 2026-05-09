; DESCRIPTION: Renders a yellow box of size 47x100 starting at (414, 20).
; PLAN: r0=414(x), r1=20(y), r2=47(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 20
LDI r2, 47
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
