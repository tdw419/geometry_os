; DESCRIPTION: Places a white 78x66 rectangle at position (188, 63).
; PLAN: r0=188(x), r1=63(y), r2=78(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 63
LDI r2, 78
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
