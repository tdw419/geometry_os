; DESCRIPTION: Places a white 20x30 rectangle at position (421, 149).
; PLAN: r0=421(x), r1=149(y), r2=20(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 149
LDI r2, 20
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
