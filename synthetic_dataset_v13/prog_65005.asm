; DESCRIPTION: Creates a purple rectangular region at (285, 98) spanning 110 by 65 pixels.
; PLAN: r0=285(x), r1=98(y), r2=110(width), r3=65(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 98
LDI r2, 110
LDI r3, 65
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
