; DESCRIPTION: Places a orange 68x25 rectangle at position (399, 216).
; PLAN: r0=399(x), r1=216(y), r2=68(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 216
LDI r2, 68
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
