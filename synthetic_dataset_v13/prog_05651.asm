; DESCRIPTION: Places a blue 69x39 rectangle at position (408, 168).
; PLAN: r0=408(x), r1=168(y), r2=69(width), r3=39(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 168
LDI r2, 69
LDI r3, 39
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
