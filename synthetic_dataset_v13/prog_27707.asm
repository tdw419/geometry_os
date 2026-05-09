; DESCRIPTION: Places a orange 12x44 rectangle at position (438, 89).
; PLAN: r0=438(x), r1=89(y), r2=12(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 89
LDI r2, 12
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
