; DESCRIPTION: Creates a purple rectangular region at (318, 98) spanning 50 by 109 pixels.
; PLAN: r0=318(x), r1=98(y), r2=50(width), r3=109(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 98
LDI r2, 50
LDI r3, 109
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
