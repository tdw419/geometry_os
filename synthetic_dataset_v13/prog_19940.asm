; DESCRIPTION: Creates a purple rectangular region at (372, 29) spanning 61 by 44 pixels.
; PLAN: r0=372(x), r1=29(y), r2=61(width), r3=44(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 29
LDI r2, 61
LDI r3, 44
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
