; DESCRIPTION: Places a blue 47x40 rectangle at position (145, 162).
; PLAN: r0=145(x), r1=162(y), r2=47(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 162
LDI r2, 47
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
