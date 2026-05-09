; DESCRIPTION: Places a yellow 87x119 rectangle at position (116, 106).
; PLAN: r0=116(x), r1=106(y), r2=87(width), r3=119(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 116
LDI r1, 106
LDI r2, 87
LDI r3, 119
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
