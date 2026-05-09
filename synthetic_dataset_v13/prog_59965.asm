; DESCRIPTION: Renders a red box of size 84x11 starting at (350, 21).
; PLAN: r0=350(x), r1=21(y), r2=84(width), r3=11(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 21
LDI r2, 84
LDI r3, 11
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
