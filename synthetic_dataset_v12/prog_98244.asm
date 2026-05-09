; DESCRIPTION: Creates a purple rectangular region at (321, 85) spanning 61 by 63 pixels.
; PLAN: r0=321(x), r1=85(y), r2=61(width), r3=63(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 85
LDI r2, 61
LDI r3, 63
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
