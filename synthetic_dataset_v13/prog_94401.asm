; DESCRIPTION: Places a purple 22x48 rectangle at position (153, 97).
; PLAN: r0=153(x), r1=97(y), r2=22(width), r3=48(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 97
LDI r2, 22
LDI r3, 48
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
