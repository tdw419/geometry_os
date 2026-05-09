; DESCRIPTION: Renders a green box of size 49x102 starting at (414, 54).
; PLAN: r0=414(x), r1=54(y), r2=49(width), r3=102(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 54
LDI r2, 49
LDI r3, 102
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
