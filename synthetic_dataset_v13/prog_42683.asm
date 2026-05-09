; DESCRIPTION: Renders a red box of size 50x11 starting at (451, 191).
; PLAN: r0=451(x), r1=191(y), r2=50(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 451
LDI r1, 191
LDI r2, 50
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
