; DESCRIPTION: Places a purple 65x10 rectangle at position (117, 193).
; PLAN: r0=117(x), r1=193(y), r2=65(width), r3=10(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 193
LDI r2, 65
LDI r3, 10
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
