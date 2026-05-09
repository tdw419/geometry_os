; DESCRIPTION: Renders a red box of size 40x56 starting at (386, 122).
; PLAN: r0=386(x), r1=122(y), r2=40(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 122
LDI r2, 40
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
