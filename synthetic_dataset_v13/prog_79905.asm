; DESCRIPTION: Renders a red box of size 51x21 starting at (326, 232).
; PLAN: r0=326(x), r1=232(y), r2=51(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 232
LDI r2, 51
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
