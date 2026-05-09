; DESCRIPTION: Renders a red box of size 87x67 starting at (285, 122).
; PLAN: r0=285(x), r1=122(y), r2=87(width), r3=67(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 122
LDI r2, 87
LDI r3, 67
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
