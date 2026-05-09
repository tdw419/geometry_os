; DESCRIPTION: Renders a purple box of size 108x87 starting at (348, 44).
; PLAN: r0=348(x), r1=44(y), r2=108(width), r3=87(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 44
LDI r2, 108
LDI r3, 87
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
