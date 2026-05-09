; DESCRIPTION: Places a white 85x108 rectangle at position (291, 99).
; PLAN: r0=291(x), r1=99(y), r2=85(width), r3=108(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 291
LDI r1, 99
LDI r2, 85
LDI r3, 108
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
