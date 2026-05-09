; DESCRIPTION: Renders a green box of size 68x35 starting at (29, 151).
; PLAN: r0=29(x), r1=151(y), r2=68(width), r3=35(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 151
LDI r2, 68
LDI r3, 35
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
