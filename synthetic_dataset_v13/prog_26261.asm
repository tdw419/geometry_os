; DESCRIPTION: Renders a yellow box of size 69x97 starting at (320, 119).
; PLAN: r0=320(x), r1=119(y), r2=69(width), r3=97(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 320
LDI r1, 119
LDI r2, 69
LDI r3, 97
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
