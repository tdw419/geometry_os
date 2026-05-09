; DESCRIPTION: Places a orange 23x63 rectangle at position (36, 102).
; PLAN: r0=36(x), r1=102(y), r2=23(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 102
LDI r2, 23
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
