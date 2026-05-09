; DESCRIPTION: Renders a yellow box of size 95x19 starting at (303, 151).
; PLAN: r0=303(x), r1=151(y), r2=95(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 151
LDI r2, 95
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
