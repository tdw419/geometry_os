; DESCRIPTION: Places a red 19x79 rectangle at position (364, 148).
; PLAN: r0=364(x), r1=148(y), r2=19(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 148
LDI r2, 19
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
