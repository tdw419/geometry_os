; DESCRIPTION: Places a purple 98x77 rectangle at position (105, 90).
; PLAN: r0=105(x), r1=90(y), r2=98(width), r3=77(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 90
LDI r2, 98
LDI r3, 77
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
