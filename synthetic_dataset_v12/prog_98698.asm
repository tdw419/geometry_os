; DESCRIPTION: Places a orange 13x109 rectangle at position (218, 52).
; PLAN: r0=218(x), r1=52(y), r2=13(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 52
LDI r2, 13
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
