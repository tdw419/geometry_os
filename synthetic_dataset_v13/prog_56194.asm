; DESCRIPTION: Creates a purple rectangular region at (373, 211) spanning 33 by 28 pixels.
; PLAN: r0=373(x), r1=211(y), r2=33(width), r3=28(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 211
LDI r2, 33
LDI r3, 28
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
