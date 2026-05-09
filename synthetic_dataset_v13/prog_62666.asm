; DESCRIPTION: Places a purple 68x108 rectangle at position (75, 117).
; PLAN: r0=75(x), r1=117(y), r2=68(width), r3=108(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 117
LDI r2, 68
LDI r3, 108
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
