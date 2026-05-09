; DESCRIPTION: Renders a green box of size 39x96 starting at (132, 73).
; PLAN: r0=132(x), r1=73(y), r2=39(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 73
LDI r2, 39
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
