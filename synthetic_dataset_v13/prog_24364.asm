; DESCRIPTION: Places a green 69x114 rectangle at position (71, 58).
; PLAN: r0=71(x), r1=58(y), r2=69(width), r3=114(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 58
LDI r2, 69
LDI r3, 114
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
