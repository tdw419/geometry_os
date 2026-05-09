; DESCRIPTION: Places a orange 79x44 rectangle at position (53, 19).
; PLAN: r0=53(x), r1=19(y), r2=79(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 19
LDI r2, 79
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
