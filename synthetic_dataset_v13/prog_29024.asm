; DESCRIPTION: Creates a blue rectangular region at (382, 2) spanning 44 by 40 pixels.
; PLAN: r0=382(x), r1=2(y), r2=44(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 2
LDI r2, 44
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
