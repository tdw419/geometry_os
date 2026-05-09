; DESCRIPTION: Creates a blue rectangular region at (75, 34) spanning 74 by 46 pixels.
; PLAN: r0=75(x), r1=34(y), r2=74(width), r3=46(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 34
LDI r2, 74
LDI r3, 46
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
