; DESCRIPTION: Renders a yellow box of size 72x87 starting at (348, 83).
; PLAN: r0=348(x), r1=83(y), r2=72(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 83
LDI r2, 72
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
