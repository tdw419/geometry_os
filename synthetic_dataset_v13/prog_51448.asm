; DESCRIPTION: Renders a yellow box of size 69x100 starting at (303, 61).
; PLAN: r0=303(x), r1=61(y), r2=69(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 61
LDI r2, 69
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
