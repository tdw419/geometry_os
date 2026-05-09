; DESCRIPTION: Places a orange 83x102 rectangle at position (371, 11).
; PLAN: r0=371(x), r1=11(y), r2=83(width), r3=102(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 11
LDI r2, 83
LDI r3, 102
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
