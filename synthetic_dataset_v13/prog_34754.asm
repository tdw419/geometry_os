; DESCRIPTION: Creates a blue rectangular region at (481, 127) spanning 13 by 106 pixels.
; PLAN: r0=481(x), r1=127(y), r2=13(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 127
LDI r2, 13
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
