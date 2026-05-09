; DESCRIPTION: Places a yellow 61x69 rectangle at position (43, 39).
; PLAN: r0=43(x), r1=39(y), r2=61(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 39
LDI r2, 61
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
