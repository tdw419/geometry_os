; DESCRIPTION: Places a blue 82x75 rectangle at position (11, 30).
; PLAN: r0=11(x), r1=30(y), r2=82(width), r3=75(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 30
LDI r2, 82
LDI r3, 75
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
