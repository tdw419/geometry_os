; DESCRIPTION: Places a blue 55x76 rectangle at position (32, 5).
; PLAN: r0=32(x), r1=5(y), r2=55(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 5
LDI r2, 55
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
