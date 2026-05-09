; DESCRIPTION: Creates a purple rectangular region at (92, 99) spanning 69 by 86 pixels.
; PLAN: r0=92(x), r1=99(y), r2=69(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 99
LDI r2, 69
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
