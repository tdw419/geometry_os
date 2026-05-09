; DESCRIPTION: Places a orange 83x109 rectangle at position (60, 62).
; PLAN: r0=60(x), r1=62(y), r2=83(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 62
LDI r2, 83
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
