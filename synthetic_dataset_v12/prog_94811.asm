; DESCRIPTION: Renders a green box of size 69x11 starting at (54, 71).
; PLAN: r0=54(x), r1=71(y), r2=69(width), r3=11(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 71
LDI r2, 69
LDI r3, 11
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
