; DESCRIPTION: Places a orange 21x53 rectangle at position (126, 79).
; PLAN: r0=126(x), r1=79(y), r2=21(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 79
LDI r2, 21
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
