; DESCRIPTION: Places a orange 40x47 rectangle at position (115, 124).
; PLAN: r0=115(x), r1=124(y), r2=40(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 124
LDI r2, 40
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
