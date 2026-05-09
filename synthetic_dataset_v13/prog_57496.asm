; DESCRIPTION: Renders a red box of size 63x71 starting at (69, 110).
; PLAN: r0=69(x), r1=110(y), r2=63(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 110
LDI r2, 63
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
