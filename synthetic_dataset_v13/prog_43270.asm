; DESCRIPTION: Creates a purple rectangular region at (335, 42) spanning 20 by 33 pixels.
; PLAN: r0=335(x), r1=42(y), r2=20(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 42
LDI r2, 20
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
