; DESCRIPTION: Renders a red box of size 52x95 starting at (310, 150).
; PLAN: r0=310(x), r1=150(y), r2=52(width), r3=95(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 150
LDI r2, 52
LDI r3, 95
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
