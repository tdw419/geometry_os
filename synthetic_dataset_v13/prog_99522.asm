; DESCRIPTION: Places a black 98x75 rectangle at position (188, 5).
; PLAN: r0=188(x), r1=5(y), r2=98(width), r3=75(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 5
LDI r2, 98
LDI r3, 75
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
