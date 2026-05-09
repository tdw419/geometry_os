; DESCRIPTION: Renders a green box of size 97x42 starting at (348, 0).
; PLAN: r0=348(x), r1=0(y), r2=97(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 0
LDI r2, 97
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
