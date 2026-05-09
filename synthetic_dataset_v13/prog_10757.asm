; DESCRIPTION: Renders a blue box of size 113x73 starting at (397, 126).
; PLAN: r0=397(x), r1=126(y), r2=113(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 397
LDI r1, 126
LDI r2, 113
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
