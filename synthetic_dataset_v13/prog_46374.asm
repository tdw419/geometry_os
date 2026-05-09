; DESCRIPTION: Places a purple 71x31 rectangle at position (349, 193).
; PLAN: r0=349(x), r1=193(y), r2=71(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 193
LDI r2, 71
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
