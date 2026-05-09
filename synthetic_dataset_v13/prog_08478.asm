; DESCRIPTION: Places a orange 26x65 rectangle at position (436, 161).
; PLAN: r0=436(x), r1=161(y), r2=26(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 161
LDI r2, 26
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
