; DESCRIPTION: Creates a purple rectangular region at (250, 187) spanning 35 by 21 pixels.
; PLAN: r0=250(x), r1=187(y), r2=35(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 187
LDI r2, 35
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
