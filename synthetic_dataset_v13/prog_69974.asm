; DESCRIPTION: Places a purple 119x75 rectangle at position (106, 178).
; PLAN: r0=106(x), r1=178(y), r2=119(width), r3=75(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 178
LDI r2, 119
LDI r3, 75
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
