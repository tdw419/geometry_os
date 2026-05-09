; DESCRIPTION: Renders a green box of size 34x114 starting at (349, 108).
; PLAN: r0=349(x), r1=108(y), r2=34(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 108
LDI r2, 34
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
