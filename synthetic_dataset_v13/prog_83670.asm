; DESCRIPTION: Places a blue 117x103 rectangle at position (85, 63).
; PLAN: r0=85(x), r1=63(y), r2=117(width), r3=103(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 63
LDI r2, 117
LDI r3, 103
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
