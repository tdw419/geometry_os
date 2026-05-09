; DESCRIPTION: Places a blue 49x79 rectangle at position (183, 50).
; PLAN: r0=183(x), r1=50(y), r2=49(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 50
LDI r2, 49
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
