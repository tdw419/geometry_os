; DESCRIPTION: Places a blue 70x79 rectangle at position (131, 26).
; PLAN: r0=131(x), r1=26(y), r2=70(width), r3=79(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 26
LDI r2, 70
LDI r3, 79
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
