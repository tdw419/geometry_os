; DESCRIPTION: Places a cyan 85x33 rectangle at position (119, 217).
; PLAN: r0=119(x), r1=217(y), r2=85(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 217
LDI r2, 85
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
