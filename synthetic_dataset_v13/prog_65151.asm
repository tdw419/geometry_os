; DESCRIPTION: Places a blue 70x63 rectangle at position (21, 15).
; PLAN: r0=21(x), r1=15(y), r2=70(width), r3=63(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 15
LDI r2, 70
LDI r3, 63
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
