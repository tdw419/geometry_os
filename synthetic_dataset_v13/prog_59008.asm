; DESCRIPTION: Renders a red box of size 25x63 starting at (379, 114).
; PLAN: r0=379(x), r1=114(y), r2=25(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 114
LDI r2, 25
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
