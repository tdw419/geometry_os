; DESCRIPTION: Creates a purple rectangular region at (210, 98) spanning 95 by 20 pixels.
; PLAN: r0=210(x), r1=98(y), r2=95(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 98
LDI r2, 95
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
