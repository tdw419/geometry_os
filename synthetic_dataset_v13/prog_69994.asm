; DESCRIPTION: Creates a purple rectangular region at (21, 65) spanning 47 by 21 pixels.
; PLAN: r0=21(x), r1=65(y), r2=47(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 65
LDI r2, 47
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
