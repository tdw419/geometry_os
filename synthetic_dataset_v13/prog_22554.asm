; DESCRIPTION: Places a blue 98x22 rectangle at position (274, 164).
; PLAN: r0=274(x), r1=164(y), r2=98(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 164
LDI r2, 98
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
