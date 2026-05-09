; DESCRIPTION: Places a purple 118x90 rectangle at position (380, 66).
; PLAN: r0=380(x), r1=66(y), r2=118(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 66
LDI r2, 118
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
