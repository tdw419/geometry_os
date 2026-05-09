; DESCRIPTION: Places a cyan 85x119 rectangle at position (375, 5).
; PLAN: r0=375(x), r1=5(y), r2=85(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 375
LDI r1, 5
LDI r2, 85
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
