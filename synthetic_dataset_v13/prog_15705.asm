; DESCRIPTION: Places a orange 13x30 rectangle at position (218, 46).
; PLAN: r0=218(x), r1=46(y), r2=13(width), r3=30(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 46
LDI r2, 13
LDI r3, 30
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
