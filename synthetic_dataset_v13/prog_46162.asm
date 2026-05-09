; DESCRIPTION: Places a white 100x44 rectangle at position (251, 191).
; PLAN: r0=251(x), r1=191(y), r2=100(width), r3=44(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 191
LDI r2, 100
LDI r3, 44
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
