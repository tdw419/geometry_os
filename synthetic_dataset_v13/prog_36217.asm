; DESCRIPTION: Places a orange 65x85 rectangle at position (213, 99).
; PLAN: r0=213(x), r1=99(y), r2=65(width), r3=85(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 99
LDI r2, 65
LDI r3, 85
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
