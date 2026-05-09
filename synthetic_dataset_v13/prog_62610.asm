; DESCRIPTION: Places a orange 115x47 rectangle at position (368, 205).
; PLAN: r0=368(x), r1=205(y), r2=115(width), r3=47(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 205
LDI r2, 115
LDI r3, 47
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
