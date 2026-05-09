; DESCRIPTION: Places a blue 16x76 rectangle at position (268, 179).
; PLAN: r0=268(x), r1=179(y), r2=16(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 179
LDI r2, 16
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
