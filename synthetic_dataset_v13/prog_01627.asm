; DESCRIPTION: Places a red 102x69 rectangle at position (0, 101).
; PLAN: r0=0(x), r1=101(y), r2=102(width), r3=69(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 101
LDI r2, 102
LDI r3, 69
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
