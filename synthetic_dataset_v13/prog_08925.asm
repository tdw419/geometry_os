; DESCRIPTION: Places a white 117x80 rectangle at position (66, 168).
; PLAN: r0=66(x), r1=168(y), r2=117(width), r3=80(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 168
LDI r2, 117
LDI r3, 80
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
