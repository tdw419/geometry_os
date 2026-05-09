; DESCRIPTION: Renders a black box of size 84x113 starting at (259, 135).
; PLAN: r0=259(x), r1=135(y), r2=84(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 135
LDI r2, 84
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
