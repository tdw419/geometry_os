; DESCRIPTION: Places a white 58x15 rectangle at position (90, 179).
; PLAN: r0=90(x), r1=179(y), r2=58(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 179
LDI r2, 58
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
