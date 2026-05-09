; DESCRIPTION: Places a blue 72x100 rectangle at position (430, 86).
; PLAN: r0=430(x), r1=86(y), r2=72(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 86
LDI r2, 72
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
