; DESCRIPTION: Renders a blue box of size 96x97 starting at (94, 113).
; PLAN: r0=94(x), r1=113(y), r2=96(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 113
LDI r2, 96
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
