; DESCRIPTION: Renders a blue box of size 39x88 starting at (278, 113).
; PLAN: r0=278(x), r1=113(y), r2=39(width), r3=88(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 278
LDI r1, 113
LDI r2, 39
LDI r3, 88
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
