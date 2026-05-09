; DESCRIPTION: Places a purple 85x74 rectangle at position (28, 65).
; PLAN: r0=28(x), r1=65(y), r2=85(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 65
LDI r2, 85
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
