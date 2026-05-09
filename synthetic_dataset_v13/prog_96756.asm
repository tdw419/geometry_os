; DESCRIPTION: Places a blue 35x104 rectangle at position (304, 130).
; PLAN: r0=304(x), r1=130(y), r2=35(width), r3=104(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 130
LDI r2, 35
LDI r3, 104
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
