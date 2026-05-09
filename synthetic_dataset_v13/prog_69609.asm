; DESCRIPTION: Places a yellow 49x69 rectangle at position (245, 62).
; PLAN: r0=245(x), r1=62(y), r2=49(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 62
LDI r2, 49
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
