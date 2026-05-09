; DESCRIPTION: Places a purple 57x75 rectangle at position (185, 132).
; PLAN: r0=185(x), r1=132(y), r2=57(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 132
LDI r2, 57
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
