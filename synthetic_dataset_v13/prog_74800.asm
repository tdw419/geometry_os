; DESCRIPTION: Places a purple 33x30 rectangle at position (96, 75).
; PLAN: r0=96(x), r1=75(y), r2=33(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 75
LDI r2, 33
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
