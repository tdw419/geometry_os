; DESCRIPTION: Places a purple 109x96 rectangle at position (295, 140).
; PLAN: r0=295(x), r1=140(y), r2=109(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 140
LDI r2, 109
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
