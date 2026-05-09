; DESCRIPTION: Places a orange 53x78 rectangle at position (130, 65).
; PLAN: r0=130(x), r1=65(y), r2=53(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 65
LDI r2, 53
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
