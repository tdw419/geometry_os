; DESCRIPTION: Creates a blue rectangular region at (75, 127) spanning 55 by 110 pixels.
; PLAN: r0=75(x), r1=127(y), r2=55(width), r3=110(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 127
LDI r2, 55
LDI r3, 110
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
