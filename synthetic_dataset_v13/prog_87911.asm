; DESCRIPTION: Places a blue 21x96 rectangle at position (430, 109).
; PLAN: r0=430(x), r1=109(y), r2=21(width), r3=96(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 109
LDI r2, 21
LDI r3, 96
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
