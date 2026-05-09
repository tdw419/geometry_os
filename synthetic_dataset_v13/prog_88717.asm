; DESCRIPTION: Places a orange 78x23 rectangle at position (225, 189).
; PLAN: r0=225(x), r1=189(y), r2=78(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 189
LDI r2, 78
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
