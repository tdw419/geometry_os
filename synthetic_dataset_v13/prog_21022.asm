; DESCRIPTION: Places a orange 30x53 rectangle at position (172, 45).
; PLAN: r0=172(x), r1=45(y), r2=30(width), r3=53(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 45
LDI r2, 30
LDI r3, 53
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
