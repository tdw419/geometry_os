; DESCRIPTION: Places a yellow 108x69 rectangle at position (318, 61).
; PLAN: r0=318(x), r1=61(y), r2=108(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 61
LDI r2, 108
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
