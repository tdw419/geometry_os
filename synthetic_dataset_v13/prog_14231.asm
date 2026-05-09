; DESCRIPTION: Places a blue 72x69 rectangle at position (34, 83).
; PLAN: r0=34(x), r1=83(y), r2=72(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 83
LDI r2, 72
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
