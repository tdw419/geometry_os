; DESCRIPTION: Creates a blue rectangular region at (115, 183) spanning 25 by 59 pixels.
; PLAN: r0=115(x), r1=183(y), r2=25(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 183
LDI r2, 25
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
