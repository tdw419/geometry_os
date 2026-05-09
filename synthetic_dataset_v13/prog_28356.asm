; DESCRIPTION: Renders a yellow box of size 69x85 starting at (120, 142).
; PLAN: r0=120(x), r1=142(y), r2=69(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 142
LDI r2, 69
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
