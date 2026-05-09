; DESCRIPTION: Places a black 20x114 rectangle at position (75, 37).
; PLAN: r0=75(x), r1=37(y), r2=20(width), r3=114(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 37
LDI r2, 20
LDI r3, 114
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
