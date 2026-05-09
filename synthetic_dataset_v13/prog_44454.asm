; DESCRIPTION: Renders a yellow box of size 49x112 starting at (304, 47).
; PLAN: r0=304(x), r1=47(y), r2=49(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 47
LDI r2, 49
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
