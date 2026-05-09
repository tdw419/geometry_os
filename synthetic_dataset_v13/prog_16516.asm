; DESCRIPTION: Renders a red box of size 49x102 starting at (337, 32).
; PLAN: r0=337(x), r1=32(y), r2=49(width), r3=102(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 32
LDI r2, 49
LDI r3, 102
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
