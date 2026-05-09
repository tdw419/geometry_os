; DESCRIPTION: Places a blue 60x50 rectangle at position (8, 7).
; PLAN: r0=8(x), r1=7(y), r2=60(width), r3=50(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 7
LDI r2, 60
LDI r3, 50
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
