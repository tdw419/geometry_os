; DESCRIPTION: Places a white 11x12 rectangle at position (339, 127).
; PLAN: r0=339(x), r1=127(y), r2=11(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 127
LDI r2, 11
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
