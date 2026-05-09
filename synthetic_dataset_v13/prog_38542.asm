; DESCRIPTION: Places a cyan 74x66 rectangle at position (83, 148).
; PLAN: r0=83(x), r1=148(y), r2=74(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 148
LDI r2, 74
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
