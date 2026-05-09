; DESCRIPTION: Places a orange 115x87 rectangle at position (47, 92).
; PLAN: r0=47(x), r1=92(y), r2=115(width), r3=87(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 92
LDI r2, 115
LDI r3, 87
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
