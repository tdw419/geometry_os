; DESCRIPTION: Renders a red box of size 49x32 starting at (42, 209).
; PLAN: r0=42(x), r1=209(y), r2=49(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 209
LDI r2, 49
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
