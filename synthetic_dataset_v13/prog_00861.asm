; DESCRIPTION: Renders a red box of size 73x68 starting at (379, 87).
; PLAN: r0=379(x), r1=87(y), r2=73(width), r3=68(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 379
LDI r1, 87
LDI r2, 73
LDI r3, 68
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
