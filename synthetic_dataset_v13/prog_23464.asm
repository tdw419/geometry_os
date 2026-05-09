; DESCRIPTION: Places a orange 16x39 rectangle at position (123, 70).
; PLAN: r0=123(x), r1=70(y), r2=16(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 70
LDI r2, 16
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
