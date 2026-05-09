; DESCRIPTION: Places a purple 86x109 rectangle at position (146, 70).
; PLAN: r0=146(x), r1=70(y), r2=86(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 70
LDI r2, 86
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
