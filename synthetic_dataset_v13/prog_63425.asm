; DESCRIPTION: Places a orange 13x62 rectangle at position (202, 90).
; PLAN: r0=202(x), r1=90(y), r2=13(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 90
LDI r2, 13
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
