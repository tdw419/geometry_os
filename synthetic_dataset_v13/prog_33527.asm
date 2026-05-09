; DESCRIPTION: Renders a green box of size 47x10 starting at (122, 43).
; PLAN: r0=122(x), r1=43(y), r2=47(width), r3=10(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 43
LDI r2, 47
LDI r3, 10
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
