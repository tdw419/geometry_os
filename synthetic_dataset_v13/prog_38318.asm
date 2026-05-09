; DESCRIPTION: Places a orange 40x87 rectangle at position (43, 98).
; PLAN: r0=43(x), r1=98(y), r2=40(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 98
LDI r2, 40
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
