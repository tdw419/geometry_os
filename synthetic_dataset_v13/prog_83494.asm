; DESCRIPTION: Renders a green box of size 58x39 starting at (134, 129).
; PLAN: r0=134(x), r1=129(y), r2=58(width), r3=39(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 129
LDI r2, 58
LDI r3, 39
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
