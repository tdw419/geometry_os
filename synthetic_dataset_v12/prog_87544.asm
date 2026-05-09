; DESCRIPTION: Creates a blue rectangular region at (138, 59) spanning 89 by 44 pixels.
; PLAN: r0=138(x), r1=59(y), r2=89(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 59
LDI r2, 89
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
