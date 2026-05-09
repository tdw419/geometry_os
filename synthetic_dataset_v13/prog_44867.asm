; DESCRIPTION: Places a orange 71x37 rectangle at position (370, 22).
; PLAN: r0=370(x), r1=22(y), r2=71(width), r3=37(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 22
LDI r2, 71
LDI r3, 37
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
