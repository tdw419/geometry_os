; DESCRIPTION: Renders a yellow box of size 69x66 starting at (245, 159).
; PLAN: r0=245(x), r1=159(y), r2=69(width), r3=66(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 159
LDI r2, 69
LDI r3, 66
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
