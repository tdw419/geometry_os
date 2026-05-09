; DESCRIPTION: Places a blue 116x11 rectangle at position (200, 37).
; PLAN: r0=200(x), r1=37(y), r2=116(width), r3=11(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 37
LDI r2, 116
LDI r3, 11
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
