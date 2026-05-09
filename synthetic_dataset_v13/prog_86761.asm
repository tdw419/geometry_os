; DESCRIPTION: Creates a purple rectangular region at (453, 187) spanning 40 by 55 pixels.
; PLAN: r0=453(x), r1=187(y), r2=40(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 187
LDI r2, 40
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
