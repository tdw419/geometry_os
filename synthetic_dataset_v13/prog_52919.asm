; DESCRIPTION: Creates a purple rectangular region at (273, 20) spanning 120 by 112 pixels.
; PLAN: r0=273(x), r1=20(y), r2=120(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 20
LDI r2, 120
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
