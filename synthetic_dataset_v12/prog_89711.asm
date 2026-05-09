; DESCRIPTION: Renders a yellow box of size 60x33 starting at (114, 181).
; PLAN: r0=114(x), r1=181(y), r2=60(width), r3=33(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 181
LDI r2, 60
LDI r3, 33
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
