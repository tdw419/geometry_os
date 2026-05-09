; DESCRIPTION: Places a orange 82x22 rectangle at position (78, 46).
; PLAN: r0=78(x), r1=46(y), r2=82(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 46
LDI r2, 82
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
