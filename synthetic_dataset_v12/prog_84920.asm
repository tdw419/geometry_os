; DESCRIPTION: Creates a blue rectangular region at (51, 34) spanning 59 by 57 pixels.
; PLAN: r0=51(x), r1=34(y), r2=59(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 34
LDI r2, 59
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
