; DESCRIPTION: Places a blue 21x12 rectangle at position (174, 5).
; PLAN: r0=174(x), r1=5(y), r2=21(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 5
LDI r2, 21
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
