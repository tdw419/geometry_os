; DESCRIPTION: Places a cyan 23x17 rectangle at position (25, 145).
; PLAN: r0=25(x), r1=145(y), r2=23(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 145
LDI r2, 23
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
