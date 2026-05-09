; DESCRIPTION: Renders a black box of size 90x29 starting at (406, 227).
; PLAN: r0=406(x), r1=227(y), r2=90(width), r3=29(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 227
LDI r2, 90
LDI r3, 29
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
