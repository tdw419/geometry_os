; DESCRIPTION: Places a blue 79x96 rectangle at position (342, 6).
; PLAN: r0=342(x), r1=6(y), r2=79(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 6
LDI r2, 79
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
