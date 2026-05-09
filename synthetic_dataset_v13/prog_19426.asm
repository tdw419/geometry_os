; DESCRIPTION: Creates a purple rectangular region at (30, 89) spanning 98 by 95 pixels.
; PLAN: r0=30(x), r1=89(y), r2=98(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 89
LDI r2, 98
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
