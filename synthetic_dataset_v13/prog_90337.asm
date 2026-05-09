; DESCRIPTION: Places a blue 79x12 rectangle at position (0, 212).
; PLAN: r0=0(x), r1=212(y), r2=79(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 212
LDI r2, 79
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
