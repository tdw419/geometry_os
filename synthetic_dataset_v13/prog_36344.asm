; DESCRIPTION: Renders a blue box of size 55x113 starting at (432, 90).
; PLAN: r0=432(x), r1=90(y), r2=55(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 90
LDI r2, 55
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
