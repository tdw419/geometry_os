; DESCRIPTION: Places a white 68x66 rectangle at position (280, 78).
; PLAN: r0=280(x), r1=78(y), r2=68(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 78
LDI r2, 68
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
