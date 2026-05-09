; DESCRIPTION: Places a purple 30x115 rectangle at position (180, 15).
; PLAN: r0=180(x), r1=15(y), r2=30(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 15
LDI r2, 30
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
