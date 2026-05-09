; DESCRIPTION: Renders a red box of size 13x84 starting at (405, 33).
; PLAN: r0=405(x), r1=33(y), r2=13(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 33
LDI r2, 13
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
