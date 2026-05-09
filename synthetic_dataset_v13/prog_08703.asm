; DESCRIPTION: Places a orange 70x77 rectangle at position (370, 66).
; PLAN: r0=370(x), r1=66(y), r2=70(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 66
LDI r2, 70
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
