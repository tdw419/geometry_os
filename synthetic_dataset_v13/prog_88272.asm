; DESCRIPTION: Renders a blue box of size 25x113 starting at (162, 84).
; PLAN: r0=162(x), r1=84(y), r2=25(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 84
LDI r2, 25
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
