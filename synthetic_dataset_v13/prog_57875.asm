; DESCRIPTION: Places a orange 21x79 rectangle at position (19, 163).
; PLAN: r0=19(x), r1=163(y), r2=21(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 163
LDI r2, 21
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
