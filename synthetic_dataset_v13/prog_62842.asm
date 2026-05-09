; DESCRIPTION: Creates a blue rectangular region at (347, 6) spanning 65 by 117 pixels.
; PLAN: r0=347(x), r1=6(y), r2=65(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 6
LDI r2, 65
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
