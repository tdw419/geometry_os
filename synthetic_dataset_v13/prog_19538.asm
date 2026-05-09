; DESCRIPTION: Renders a red box of size 13x97 starting at (339, 14).
; PLAN: r0=339(x), r1=14(y), r2=13(width), r3=97(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 14
LDI r2, 13
LDI r3, 97
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
