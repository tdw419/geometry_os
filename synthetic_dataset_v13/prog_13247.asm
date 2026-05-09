; DESCRIPTION: Renders a yellow box of size 67x82 starting at (348, 163).
; PLAN: r0=348(x), r1=163(y), r2=67(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 163
LDI r2, 67
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
