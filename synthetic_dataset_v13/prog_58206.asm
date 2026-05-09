; DESCRIPTION: Renders a red box of size 59x52 starting at (13, 176).
; PLAN: r0=13(x), r1=176(y), r2=59(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 176
LDI r2, 59
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
