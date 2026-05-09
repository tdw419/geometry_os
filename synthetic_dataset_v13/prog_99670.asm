; DESCRIPTION: Creates a purple rectangular region at (146, 0) spanning 37 by 88 pixels.
; PLAN: r0=146(x), r1=0(y), r2=37(width), r3=88(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 0
LDI r2, 37
LDI r3, 88
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
