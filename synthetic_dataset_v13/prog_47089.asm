; DESCRIPTION: Creates a purple rectangular region at (60, 144) spanning 45 by 43 pixels.
; PLAN: r0=60(x), r1=144(y), r2=45(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 144
LDI r2, 45
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
