; DESCRIPTION: Creates a blue rectangular region at (144, 57) spanning 72 by 44 pixels.
; PLAN: r0=144(x), r1=57(y), r2=72(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 57
LDI r2, 72
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
