; DESCRIPTION: Places a orange 20x23 rectangle at position (438, 72).
; PLAN: r0=438(x), r1=72(y), r2=20(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 72
LDI r2, 20
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
