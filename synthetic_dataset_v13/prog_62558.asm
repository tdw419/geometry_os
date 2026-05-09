; DESCRIPTION: Places a purple 90x68 rectangle at position (285, 90).
; PLAN: r0=285(x), r1=90(y), r2=90(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 90
LDI r2, 90
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
