; DESCRIPTION: Places a purple 45x38 rectangle at position (307, 162).
; PLAN: r0=307(x), r1=162(y), r2=45(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 162
LDI r2, 45
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
