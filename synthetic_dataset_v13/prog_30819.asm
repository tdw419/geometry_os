; DESCRIPTION: Places a green 75x79 rectangle at position (12, 116).
; PLAN: r0=12(x), r1=116(y), r2=75(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 116
LDI r2, 75
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
