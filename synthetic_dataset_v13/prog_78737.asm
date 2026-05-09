; DESCRIPTION: Places a orange 21x38 rectangle at position (471, 8).
; PLAN: r0=471(x), r1=8(y), r2=21(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 8
LDI r2, 21
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
