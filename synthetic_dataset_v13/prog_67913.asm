; DESCRIPTION: Renders a black box of size 97x28 starting at (283, 16).
; PLAN: r0=283(x), r1=16(y), r2=97(width), r3=28(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 283
LDI r1, 16
LDI r2, 97
LDI r3, 28
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
