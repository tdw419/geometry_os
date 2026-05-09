; DESCRIPTION: Places a white 23x26 rectangle at position (318, 117).
; PLAN: r0=318(x), r1=117(y), r2=23(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 117
LDI r2, 23
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
