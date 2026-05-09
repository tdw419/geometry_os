; DESCRIPTION: Renders a white box of size 52x96 starting at (249, 95).
; PLAN: r0=249(x), r1=95(y), r2=52(width), r3=96(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 95
LDI r2, 52
LDI r3, 96
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
