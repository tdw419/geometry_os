; DESCRIPTION: Creates a blue rectangular region at (44, 27) spanning 84 by 74 pixels.
; PLAN: r0=44(x), r1=27(y), r2=84(width), r3=74(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 27
LDI r2, 84
LDI r3, 74
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
