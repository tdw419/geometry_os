; DESCRIPTION: Places a purple 78x70 rectangle at position (330, 186).
; PLAN: r0=330(x), r1=186(y), r2=78(width), r3=70(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 186
LDI r2, 78
LDI r3, 70
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
