; DESCRIPTION: Places a orange 44x12 rectangle at position (361, 48).
; PLAN: r0=361(x), r1=48(y), r2=44(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 48
LDI r2, 44
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
