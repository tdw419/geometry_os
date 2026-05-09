; DESCRIPTION: Places a red 92x69 rectangle at position (33, 53).
; PLAN: r0=33(x), r1=53(y), r2=92(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 53
LDI r2, 92
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
