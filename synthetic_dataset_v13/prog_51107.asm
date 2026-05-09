; DESCRIPTION: Renders a yellow box of size 62x49 starting at (434, 42).
; PLAN: r0=434(x), r1=42(y), r2=62(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 42
LDI r2, 62
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
