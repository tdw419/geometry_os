; DESCRIPTION: Creates a purple rectangular region at (239, 4) spanning 94 by 100 pixels.
; PLAN: r0=239(x), r1=4(y), r2=94(width), r3=100(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 239
LDI r1, 4
LDI r2, 94
LDI r3, 100
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
