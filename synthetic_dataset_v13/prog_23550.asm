; DESCRIPTION: Creates a purple rectangular region at (9, 7) spanning 21 by 57 pixels.
; PLAN: r0=9(x), r1=7(y), r2=21(width), r3=57(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 7
LDI r2, 21
LDI r3, 57
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
