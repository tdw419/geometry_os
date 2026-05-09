; DESCRIPTION: Places a yellow 55x43 rectangle at position (310, 78).
; PLAN: r0=310(x), r1=78(y), r2=55(width), r3=43(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 78
LDI r2, 55
LDI r3, 43
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
