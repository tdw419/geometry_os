; DESCRIPTION: Places a blue 15x34 rectangle at position (91, 175).
; PLAN: r0=91(x), r1=175(y), r2=15(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 175
LDI r2, 15
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
