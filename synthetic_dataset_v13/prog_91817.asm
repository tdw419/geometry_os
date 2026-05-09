; DESCRIPTION: Places a orange 34x57 rectangle at position (421, 127).
; PLAN: r0=421(x), r1=127(y), r2=34(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 127
LDI r2, 34
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
