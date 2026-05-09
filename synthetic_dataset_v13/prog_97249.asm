; DESCRIPTION: Renders a red box of size 71x84 starting at (329, 98).
; PLAN: r0=329(x), r1=98(y), r2=71(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 98
LDI r2, 71
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
