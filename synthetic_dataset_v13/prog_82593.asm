; DESCRIPTION: Creates a purple rectangular region at (422, 112) spanning 85 by 107 pixels.
; PLAN: r0=422(x), r1=112(y), r2=85(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 422
LDI r1, 112
LDI r2, 85
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
