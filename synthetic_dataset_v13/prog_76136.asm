; DESCRIPTION: Places a orange 63x114 rectangle at position (248, 82).
; PLAN: r0=248(x), r1=82(y), r2=63(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 82
LDI r2, 63
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
