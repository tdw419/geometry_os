; DESCRIPTION: Places a blue 45x94 rectangle at position (373, 103).
; PLAN: r0=373(x), r1=103(y), r2=45(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 103
LDI r2, 45
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
