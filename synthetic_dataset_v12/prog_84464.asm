; DESCRIPTION: Renders a orange box of size 108x113 starting at (84, 51).
; PLAN: r0=84(x), r1=51(y), r2=108(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 51
LDI r2, 108
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
