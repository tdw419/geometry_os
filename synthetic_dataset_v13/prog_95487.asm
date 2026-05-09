; DESCRIPTION: Places a orange 43x33 rectangle at position (156, 31).
; PLAN: r0=156(x), r1=31(y), r2=43(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 31
LDI r2, 43
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
