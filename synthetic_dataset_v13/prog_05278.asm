; DESCRIPTION: Renders a red box of size 84x110 starting at (406, 110).
; PLAN: r0=406(x), r1=110(y), r2=84(width), r3=110(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 110
LDI r2, 84
LDI r3, 110
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
