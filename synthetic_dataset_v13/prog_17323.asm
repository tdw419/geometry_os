; DESCRIPTION: Places a purple 48x44 rectangle at position (88, 99).
; PLAN: r0=88(x), r1=99(y), r2=48(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 99
LDI r2, 48
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
