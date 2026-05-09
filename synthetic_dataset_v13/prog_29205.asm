; DESCRIPTION: Places a red 31x44 rectangle at position (70, 145).
; PLAN: r0=70(x), r1=145(y), r2=31(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 145
LDI r2, 31
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
