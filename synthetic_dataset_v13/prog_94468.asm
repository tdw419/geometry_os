; DESCRIPTION: Renders a blue box of size 90x97 starting at (397, 135).
; PLAN: r0=397(x), r1=135(y), r2=90(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 135
LDI r2, 90
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
