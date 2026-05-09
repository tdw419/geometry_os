; DESCRIPTION: Places a white 117x97 rectangle at position (27, 109).
; PLAN: r0=27(x), r1=109(y), r2=117(width), r3=97(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 109
LDI r2, 117
LDI r3, 97
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
