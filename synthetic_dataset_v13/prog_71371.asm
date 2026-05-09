; DESCRIPTION: Places a blue 45x82 rectangle at position (328, 130).
; PLAN: r0=328(x), r1=130(y), r2=45(width), r3=82(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 130
LDI r2, 45
LDI r3, 82
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
