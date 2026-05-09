; DESCRIPTION: Renders a red box of size 105x84 starting at (277, 63).
; PLAN: r0=277(x), r1=63(y), r2=105(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 277
LDI r1, 63
LDI r2, 105
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
