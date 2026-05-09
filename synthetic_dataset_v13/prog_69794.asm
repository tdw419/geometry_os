; DESCRIPTION: Places a orange 46x13 rectangle at position (150, 46).
; PLAN: r0=150(x), r1=46(y), r2=46(width), r3=13(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 46
LDI r2, 46
LDI r3, 13
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
