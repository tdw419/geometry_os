; DESCRIPTION: Places a white 52x69 rectangle at position (321, 140).
; PLAN: r0=321(x), r1=140(y), r2=52(width), r3=69(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 140
LDI r2, 52
LDI r3, 69
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
