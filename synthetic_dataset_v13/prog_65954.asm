; DESCRIPTION: Creates a purple rectangular region at (444, 127) spanning 45 by 115 pixels.
; PLAN: r0=444(x), r1=127(y), r2=45(width), r3=115(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 444
LDI r1, 127
LDI r2, 45
LDI r3, 115
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
