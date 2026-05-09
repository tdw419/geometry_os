; DESCRIPTION: Places a cyan 59x106 rectangle at position (31, 145).
; PLAN: r0=31(x), r1=145(y), r2=59(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 145
LDI r2, 59
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
