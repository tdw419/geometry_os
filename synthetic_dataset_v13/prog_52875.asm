; DESCRIPTION: Places a orange 23x39 rectangle at position (229, 118).
; PLAN: r0=229(x), r1=118(y), r2=23(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 118
LDI r2, 23
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
