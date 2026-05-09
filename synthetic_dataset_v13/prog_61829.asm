; DESCRIPTION: Places a red 58x35 rectangle at position (327, 69).
; PLAN: r0=327(x), r1=69(y), r2=58(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 69
LDI r2, 58
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
