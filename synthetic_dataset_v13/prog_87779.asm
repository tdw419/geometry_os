; DESCRIPTION: Renders a yellow box of size 24x24 starting at (348, 97).
; PLAN: r0=348(x), r1=97(y), r2=24(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 97
LDI r2, 24
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
