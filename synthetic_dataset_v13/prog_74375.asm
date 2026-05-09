; DESCRIPTION: Places a blue 81x70 rectangle at position (321, 134).
; PLAN: r0=321(x), r1=134(y), r2=81(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 134
LDI r2, 81
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
