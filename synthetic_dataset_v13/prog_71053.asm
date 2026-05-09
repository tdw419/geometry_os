; DESCRIPTION: Places a purple 40x23 rectangle at position (25, 165).
; PLAN: r0=25(x), r1=165(y), r2=40(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 165
LDI r2, 40
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
