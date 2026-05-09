; DESCRIPTION: Renders a red box of size 115x52 starting at (371, 1).
; PLAN: r0=371(x), r1=1(y), r2=115(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 1
LDI r2, 115
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
