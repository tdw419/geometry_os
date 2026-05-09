; DESCRIPTION: Creates a purple rectangular region at (37, 80) spanning 33 by 120 pixels.
; PLAN: r0=37(x), r1=80(y), r2=33(width), r3=120(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 80
LDI r2, 33
LDI r3, 120
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
