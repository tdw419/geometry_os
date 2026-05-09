; DESCRIPTION: Places a blue 75x20 rectangle at position (166, 157).
; PLAN: r0=166(x), r1=157(y), r2=75(width), r3=20(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 157
LDI r2, 75
LDI r3, 20
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
