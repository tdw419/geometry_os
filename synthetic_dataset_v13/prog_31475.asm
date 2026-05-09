; DESCRIPTION: Places a red 37x12 rectangle at position (132, 90).
; PLAN: r0=132(x), r1=90(y), r2=37(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 90
LDI r2, 37
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
