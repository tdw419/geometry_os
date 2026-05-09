; DESCRIPTION: Creates a purple rectangular region at (57, 66) spanning 66 by 91 pixels.
; PLAN: r0=57(x), r1=66(y), r2=66(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 66
LDI r2, 66
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
