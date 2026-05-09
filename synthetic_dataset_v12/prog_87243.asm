; DESCRIPTION: Places a yellow 102x69 rectangle at position (159, 185).
; PLAN: r0=159(x), r1=185(y), r2=102(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 185
LDI r2, 102
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
