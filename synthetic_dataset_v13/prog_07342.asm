; DESCRIPTION: Places a orange 60x99 rectangle at position (166, 109).
; PLAN: r0=166(x), r1=109(y), r2=60(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 109
LDI r2, 60
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
