; DESCRIPTION: Creates a purple rectangular region at (150, 135) spanning 23 by 37 pixels.
; PLAN: r0=150(x), r1=135(y), r2=23(width), r3=37(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 135
LDI r2, 23
LDI r3, 37
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
