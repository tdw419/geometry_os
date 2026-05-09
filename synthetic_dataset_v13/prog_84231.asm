; DESCRIPTION: Places a cyan 47x15 rectangle at position (138, 149).
; PLAN: r0=138(x), r1=149(y), r2=47(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 149
LDI r2, 47
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
