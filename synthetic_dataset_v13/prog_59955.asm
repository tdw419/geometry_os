; DESCRIPTION: Places a orange 20x57 rectangle at position (149, 153).
; PLAN: r0=149(x), r1=153(y), r2=20(width), r3=57(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 153
LDI r2, 20
LDI r3, 57
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
