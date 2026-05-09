; DESCRIPTION: Places a white 80x23 rectangle at position (123, 216).
; PLAN: r0=123(x), r1=216(y), r2=80(width), r3=23(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 216
LDI r2, 80
LDI r3, 23
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
