; DESCRIPTION: Places a purple 66x37 rectangle at position (307, 77).
; PLAN: r0=307(x), r1=77(y), r2=66(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 77
LDI r2, 66
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
