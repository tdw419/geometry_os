; DESCRIPTION: Places a purple 54x56 rectangle at position (25, 66).
; PLAN: r0=25(x), r1=66(y), r2=54(width), r3=56(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 66
LDI r2, 54
LDI r3, 56
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
