; DESCRIPTION: Renders a yellow box of size 61x43 starting at (114, 71).
; PLAN: r0=114(x), r1=71(y), r2=61(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 71
LDI r2, 61
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
