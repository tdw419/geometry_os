; DESCRIPTION: Renders a red box of size 72x49 starting at (337, 137).
; PLAN: r0=337(x), r1=137(y), r2=72(width), r3=49(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 137
LDI r2, 72
LDI r3, 49
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
