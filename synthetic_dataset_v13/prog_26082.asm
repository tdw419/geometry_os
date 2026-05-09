; DESCRIPTION: Renders a white box of size 111x108 starting at (153, 100).
; PLAN: r0=153(x), r1=100(y), r2=111(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 100
LDI r2, 111
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
