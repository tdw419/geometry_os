; DESCRIPTION: Renders a yellow box of size 120x70 starting at (102, 53).
; PLAN: r0=102(x), r1=53(y), r2=120(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 53
LDI r2, 120
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
