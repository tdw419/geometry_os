; DESCRIPTION: Renders a black box of size 32x113 starting at (174, 97).
; PLAN: r0=174(x), r1=97(y), r2=32(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 97
LDI r2, 32
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
