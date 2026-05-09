; DESCRIPTION: Renders a red box of size 79x56 starting at (39, 100).
; PLAN: r0=39(x), r1=100(y), r2=79(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 39
LDI r1, 100
LDI r2, 79
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
