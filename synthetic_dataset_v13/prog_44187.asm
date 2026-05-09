; DESCRIPTION: Renders a black box of size 11x113 starting at (231, 27).
; PLAN: r0=231(x), r1=27(y), r2=11(width), r3=113(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 27
LDI r2, 11
LDI r3, 113
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
