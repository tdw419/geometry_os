; DESCRIPTION: Renders a yellow box of size 42x24 starting at (58, 9).
; PLAN: r0=58(x), r1=9(y), r2=42(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 9
LDI r2, 42
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
