; DESCRIPTION: Renders a red box of size 62x60 starting at (42, 167).
; PLAN: r0=42(x), r1=167(y), r2=62(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 167
LDI r2, 62
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
