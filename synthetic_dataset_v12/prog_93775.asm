; DESCRIPTION: Places a blue 75x95 rectangle at position (85, 138).
; PLAN: r0=85(x), r1=138(y), r2=75(width), r3=95(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 138
LDI r2, 75
LDI r3, 95
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
