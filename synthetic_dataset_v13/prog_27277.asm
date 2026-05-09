; DESCRIPTION: Places a purple 47x17 rectangle at position (185, 220).
; PLAN: r0=185(x), r1=220(y), r2=47(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 220
LDI r2, 47
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
