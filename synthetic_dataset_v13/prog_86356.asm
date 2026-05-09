; DESCRIPTION: Renders a red box of size 11x113 starting at (481, 13).
; PLAN: r0=481(x), r1=13(y), r2=11(width), r3=113(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 13
LDI r2, 11
LDI r3, 113
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
