; DESCRIPTION: Creates a blue rectangular region at (304, 77) spanning 100 by 40 pixels.
; PLAN: r0=304(x), r1=77(y), r2=100(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 77
LDI r2, 100
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
