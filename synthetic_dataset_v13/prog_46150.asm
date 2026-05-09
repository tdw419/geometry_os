; DESCRIPTION: Creates a purple rectangular region at (298, 34) spanning 11 by 85 pixels.
; PLAN: r0=298(x), r1=34(y), r2=11(width), r3=85(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 34
LDI r2, 11
LDI r3, 85
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
