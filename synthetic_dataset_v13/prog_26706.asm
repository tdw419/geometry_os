; DESCRIPTION: Places a orange 58x25 rectangle at position (4, 157).
; PLAN: r0=4(x), r1=157(y), r2=58(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 157
LDI r2, 58
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
