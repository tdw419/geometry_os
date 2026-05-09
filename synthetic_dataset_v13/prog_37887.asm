; DESCRIPTION: Renders a red box of size 72x24 starting at (325, 217).
; PLAN: r0=325(x), r1=217(y), r2=72(width), r3=24(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 325
LDI r1, 217
LDI r2, 72
LDI r3, 24
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
