; DESCRIPTION: Places a orange 21x74 rectangle at position (361, 145).
; PLAN: r0=361(x), r1=145(y), r2=21(width), r3=74(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 145
LDI r2, 21
LDI r3, 74
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
