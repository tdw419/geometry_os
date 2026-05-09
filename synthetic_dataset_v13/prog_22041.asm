; DESCRIPTION: Places a blue 60x100 rectangle at position (212, 142).
; PLAN: r0=212(x), r1=142(y), r2=60(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 142
LDI r2, 60
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
