; DESCRIPTION: Places a purple 75x73 rectangle at position (95, 70).
; PLAN: r0=95(x), r1=70(y), r2=75(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 70
LDI r2, 75
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
