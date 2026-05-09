; DESCRIPTION: Places a blue 120x69 rectangle at position (367, 74).
; PLAN: r0=367(x), r1=74(y), r2=120(width), r3=69(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 74
LDI r2, 120
LDI r3, 69
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
