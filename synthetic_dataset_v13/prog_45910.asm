; DESCRIPTION: Places a blue 60x12 rectangle at position (264, 83).
; PLAN: r0=264(x), r1=83(y), r2=60(width), r3=12(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 83
LDI r2, 60
LDI r3, 12
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
