; DESCRIPTION: Renders a red box of size 85x84 starting at (113, 89).
; PLAN: r0=113(x), r1=89(y), r2=85(width), r3=84(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 89
LDI r2, 85
LDI r3, 84
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
