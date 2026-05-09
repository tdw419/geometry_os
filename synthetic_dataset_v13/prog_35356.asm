; DESCRIPTION: Renders a white box of size 27x15 starting at (278, 158).
; PLAN: r0=278(x), r1=158(y), r2=27(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 158
LDI r2, 27
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
