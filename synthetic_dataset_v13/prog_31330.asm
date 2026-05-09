; DESCRIPTION: Places a blue 70x13 rectangle at position (167, 55).
; PLAN: r0=167(x), r1=55(y), r2=70(width), r3=13(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 55
LDI r2, 70
LDI r3, 13
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
