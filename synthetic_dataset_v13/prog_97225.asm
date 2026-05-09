; DESCRIPTION: Renders a blue box of size 33x61 starting at (121, 132).
; PLAN: r0=121(x), r1=132(y), r2=33(width), r3=61(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 132
LDI r2, 33
LDI r3, 61
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
