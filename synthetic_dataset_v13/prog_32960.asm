; DESCRIPTION: Places a orange 99x38 rectangle at position (252, 196).
; PLAN: r0=252(x), r1=196(y), r2=99(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 196
LDI r2, 99
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
