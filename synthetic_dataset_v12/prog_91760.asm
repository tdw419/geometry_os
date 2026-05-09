; DESCRIPTION: Creates a purple rectangular region at (196, 26) spanning 10 by 80 pixels.
; PLAN: r0=196(x), r1=26(y), r2=10(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 26
LDI r2, 10
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
