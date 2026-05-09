; DESCRIPTION: Creates a purple rectangular region at (405, 75) spanning 58 by 61 pixels.
; PLAN: r0=405(x), r1=75(y), r2=58(width), r3=61(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 75
LDI r2, 58
LDI r3, 61
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
