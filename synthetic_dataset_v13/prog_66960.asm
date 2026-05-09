; DESCRIPTION: Creates a purple rectangular region at (350, 66) spanning 47 by 47 pixels.
; PLAN: r0=350(x), r1=66(y), r2=47(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 66
LDI r2, 47
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
