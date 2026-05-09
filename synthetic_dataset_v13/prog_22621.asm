; DESCRIPTION: Renders a red box of size 84x51 starting at (91, 67).
; PLAN: r0=91(x), r1=67(y), r2=84(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 67
LDI r2, 84
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
