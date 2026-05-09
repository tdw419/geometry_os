; DESCRIPTION: Creates a purple rectangular region at (270, 183) spanning 59 by 39 pixels.
; PLAN: r0=270(x), r1=183(y), r2=59(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 183
LDI r2, 59
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
