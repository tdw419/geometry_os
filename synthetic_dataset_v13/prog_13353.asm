; DESCRIPTION: Places a orange 52x55 rectangle at position (326, 44).
; PLAN: r0=326(x), r1=44(y), r2=52(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 44
LDI r2, 52
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
