; DESCRIPTION: Places a blue 69x81 rectangle at position (394, 14).
; PLAN: r0=394(x), r1=14(y), r2=69(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 14
LDI r2, 69
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
