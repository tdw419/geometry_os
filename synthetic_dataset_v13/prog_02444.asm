; DESCRIPTION: Creates a blue rectangular region at (44, 220) spanning 71 by 25 pixels.
; PLAN: r0=44(x), r1=220(y), r2=71(width), r3=25(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 220
LDI r2, 71
LDI r3, 25
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
