; DESCRIPTION: Places a white 58x108 rectangle at position (412, 15).
; PLAN: r0=412(x), r1=15(y), r2=58(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 15
LDI r2, 58
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
