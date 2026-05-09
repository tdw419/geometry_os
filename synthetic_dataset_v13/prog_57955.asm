; DESCRIPTION: Places a white 45x56 rectangle at position (293, 106).
; PLAN: r0=293(x), r1=106(y), r2=45(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 106
LDI r2, 45
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
