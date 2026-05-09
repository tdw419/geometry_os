; DESCRIPTION: Renders a yellow box of size 47x36 starting at (134, 203).
; PLAN: r0=134(x), r1=203(y), r2=47(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 203
LDI r2, 47
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
