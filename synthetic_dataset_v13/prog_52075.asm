; DESCRIPTION: Places a purple 10x45 rectangle at position (212, 70).
; PLAN: r0=212(x), r1=70(y), r2=10(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 70
LDI r2, 10
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
