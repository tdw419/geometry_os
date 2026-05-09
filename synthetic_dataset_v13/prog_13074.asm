; DESCRIPTION: Places a blue 37x23 rectangle at position (428, 95).
; PLAN: r0=428(x), r1=95(y), r2=37(width), r3=23(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 95
LDI r2, 37
LDI r3, 23
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
