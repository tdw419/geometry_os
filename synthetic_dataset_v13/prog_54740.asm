; DESCRIPTION: Places a orange 44x50 rectangle at position (247, 99).
; PLAN: r0=247(x), r1=99(y), r2=44(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 99
LDI r2, 44
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
