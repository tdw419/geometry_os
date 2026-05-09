; DESCRIPTION: Places a orange 44x81 rectangle at position (126, 13).
; PLAN: r0=126(x), r1=13(y), r2=44(width), r3=81(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 13
LDI r2, 44
LDI r3, 81
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
