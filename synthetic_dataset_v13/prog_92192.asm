; DESCRIPTION: Places a blue 28x31 rectangle at position (456, 183).
; PLAN: r0=456(x), r1=183(y), r2=28(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 183
LDI r2, 28
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
