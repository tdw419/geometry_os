; DESCRIPTION: Places a orange 85x46 rectangle at position (176, 185).
; PLAN: r0=176(x), r1=185(y), r2=85(width), r3=46(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 185
LDI r2, 85
LDI r3, 46
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
