; DESCRIPTION: Places a white 26x63 rectangle at position (176, 79).
; PLAN: r0=176(x), r1=79(y), r2=26(width), r3=63(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 79
LDI r2, 26
LDI r3, 63
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
