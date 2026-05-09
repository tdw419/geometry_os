; DESCRIPTION: Renders a red box of size 84x13 starting at (208, 212).
; PLAN: r0=208(x), r1=212(y), r2=84(width), r3=13(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 212
LDI r2, 84
LDI r3, 13
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
