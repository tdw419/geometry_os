; DESCRIPTION: Places a white 117x23 rectangle at position (251, 178).
; PLAN: r0=251(x), r1=178(y), r2=117(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 178
LDI r2, 117
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
