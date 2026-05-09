; DESCRIPTION: Creates a purple rectangular region at (213, 50) spanning 37 by 31 pixels.
; PLAN: r0=213(x), r1=50(y), r2=37(width), r3=31(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 50
LDI r2, 37
LDI r3, 31
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
