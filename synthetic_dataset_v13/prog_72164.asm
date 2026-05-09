; DESCRIPTION: Creates a purple rectangular region at (180, 65) spanning 83 by 99 pixels.
; PLAN: r0=180(x), r1=65(y), r2=83(width), r3=99(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 65
LDI r2, 83
LDI r3, 99
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
