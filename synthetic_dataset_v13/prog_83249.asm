; DESCRIPTION: Places a white 117x94 rectangle at position (357, 26).
; PLAN: r0=357(x), r1=26(y), r2=117(width), r3=94(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 26
LDI r2, 117
LDI r3, 94
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
