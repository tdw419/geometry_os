; DESCRIPTION: Renders a green box of size 62x14 starting at (304, 73).
; PLAN: r0=304(x), r1=73(y), r2=62(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 73
LDI r2, 62
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
