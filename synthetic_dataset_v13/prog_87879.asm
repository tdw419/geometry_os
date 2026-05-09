; DESCRIPTION: Renders a yellow box of size 69x111 starting at (43, 94).
; PLAN: r0=43(x), r1=94(y), r2=69(width), r3=111(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 94
LDI r2, 69
LDI r3, 111
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
