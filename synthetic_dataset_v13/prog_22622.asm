; DESCRIPTION: Places a blue 32x60 rectangle at position (248, 130).
; PLAN: r0=248(x), r1=130(y), r2=32(width), r3=60(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 130
LDI r2, 32
LDI r3, 60
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
