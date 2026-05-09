; DESCRIPTION: Places a blue 69x45 rectangle at position (313, 141).
; PLAN: r0=313(x), r1=141(y), r2=69(width), r3=45(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 141
LDI r2, 69
LDI r3, 45
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
