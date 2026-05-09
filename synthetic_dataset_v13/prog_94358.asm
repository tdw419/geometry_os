; DESCRIPTION: Places a orange 39x26 rectangle at position (406, 14).
; PLAN: r0=406(x), r1=14(y), r2=39(width), r3=26(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 14
LDI r2, 39
LDI r3, 26
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
