; DESCRIPTION: Places a blue 102x19 rectangle at position (381, 5).
; PLAN: r0=381(x), r1=5(y), r2=102(width), r3=19(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 5
LDI r2, 102
LDI r3, 19
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
