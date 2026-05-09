; DESCRIPTION: Places a orange 48x107 rectangle at position (161, 35).
; PLAN: r0=161(x), r1=35(y), r2=48(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 35
LDI r2, 48
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
