; DESCRIPTION: Places a orange 21x66 rectangle at position (129, 187).
; PLAN: r0=129(x), r1=187(y), r2=21(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 187
LDI r2, 21
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
