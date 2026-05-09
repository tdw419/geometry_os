; DESCRIPTION: Places a orange 35x120 rectangle at position (355, 8).
; PLAN: r0=355(x), r1=8(y), r2=35(width), r3=120(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 8
LDI r2, 35
LDI r3, 120
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
