; DESCRIPTION: Places a blue 12x69 rectangle at position (368, 62).
; PLAN: r0=368(x), r1=62(y), r2=12(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 62
LDI r2, 12
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
