; DESCRIPTION: Renders a red box of size 64x76 starting at (121, 132).
; PLAN: r0=121(x), r1=132(y), r2=64(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 132
LDI r2, 64
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
