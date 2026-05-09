; DESCRIPTION: Places a white 34x60 rectangle at position (407, 89).
; PLAN: r0=407(x), r1=89(y), r2=34(width), r3=60(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 89
LDI r2, 34
LDI r3, 60
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
