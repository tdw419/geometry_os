; DESCRIPTION: Places a orange 65x23 rectangle at position (223, 26).
; PLAN: r0=223(x), r1=26(y), r2=65(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 223
LDI r1, 26
LDI r2, 65
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
