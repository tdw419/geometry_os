; DESCRIPTION: Places a orange 55x57 rectangle at position (281, 123).
; PLAN: r0=281(x), r1=123(y), r2=55(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 281
LDI r1, 123
LDI r2, 55
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
