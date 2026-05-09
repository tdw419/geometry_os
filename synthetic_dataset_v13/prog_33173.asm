; DESCRIPTION: Places a blue 29x73 rectangle at position (461, 14).
; PLAN: r0=461(x), r1=14(y), r2=29(width), r3=73(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 14
LDI r2, 29
LDI r3, 73
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
