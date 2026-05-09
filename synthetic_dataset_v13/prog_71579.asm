; DESCRIPTION: Places a blue 26x55 rectangle at position (467, 1).
; PLAN: r0=467(x), r1=1(y), r2=26(width), r3=55(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 1
LDI r2, 26
LDI r3, 55
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
