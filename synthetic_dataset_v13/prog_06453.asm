; DESCRIPTION: Places a purple 39x68 rectangle at position (120, 19).
; PLAN: r0=120(x), r1=19(y), r2=39(width), r3=68(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 19
LDI r2, 39
LDI r3, 68
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
