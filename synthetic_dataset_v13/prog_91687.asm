; DESCRIPTION: Renders a red box of size 42x26 starting at (232, 197).
; PLAN: r0=232(x), r1=197(y), r2=42(width), r3=26(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 197
LDI r2, 42
LDI r3, 26
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
