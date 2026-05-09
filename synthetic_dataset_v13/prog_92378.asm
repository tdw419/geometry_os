; DESCRIPTION: Renders a green box of size 46x70 starting at (303, 151).
; PLAN: r0=303(x), r1=151(y), r2=46(width), r3=70(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 151
LDI r2, 46
LDI r3, 70
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
