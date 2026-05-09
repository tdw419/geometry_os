; DESCRIPTION: Places a white 114x95 rectangle at position (339, 132).
; PLAN: r0=339(x), r1=132(y), r2=114(width), r3=95(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 132
LDI r2, 114
LDI r3, 95
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
