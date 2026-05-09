; DESCRIPTION: Places a white 15x12 rectangle at position (438, 114).
; PLAN: r0=438(x), r1=114(y), r2=15(width), r3=12(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 114
LDI r2, 15
LDI r3, 12
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
