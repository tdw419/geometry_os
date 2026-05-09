; DESCRIPTION: Places a white 43x45 rectangle at position (371, 201).
; PLAN: r0=371(x), r1=201(y), r2=43(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 201
LDI r2, 43
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
