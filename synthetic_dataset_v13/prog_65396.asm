; DESCRIPTION: Renders a red box of size 35x52 starting at (54, 195).
; PLAN: r0=54(x), r1=195(y), r2=35(width), r3=52(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 195
LDI r2, 35
LDI r3, 52
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
