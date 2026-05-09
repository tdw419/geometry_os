; DESCRIPTION: Creates a purple rectangular region at (91, 115) spanning 61 by 37 pixels.
; PLAN: r0=91(x), r1=115(y), r2=61(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 115
LDI r2, 61
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
