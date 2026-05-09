; DESCRIPTION: Places a purple 98x97 rectangle at position (300, 36).
; PLAN: r0=300(x), r1=36(y), r2=98(width), r3=97(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 300
LDI r1, 36
LDI r2, 98
LDI r3, 97
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
