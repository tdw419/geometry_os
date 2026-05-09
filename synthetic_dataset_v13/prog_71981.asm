; DESCRIPTION: Creates a purple rectangular region at (373, 144) spanning 109 by 25 pixels.
; PLAN: r0=373(x), r1=144(y), r2=109(width), r3=25(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 144
LDI r2, 109
LDI r3, 25
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
