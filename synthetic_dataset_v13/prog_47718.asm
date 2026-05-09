; DESCRIPTION: Creates a purple rectangular region at (372, 3) spanning 92 by 86 pixels.
; PLAN: r0=372(x), r1=3(y), r2=92(width), r3=86(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 3
LDI r2, 92
LDI r3, 86
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
