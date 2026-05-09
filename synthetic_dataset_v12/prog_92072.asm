; DESCRIPTION: Places a blue 35x116 rectangle at position (85, 139).
; PLAN: r0=85(x), r1=139(y), r2=35(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 139
LDI r2, 35
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
