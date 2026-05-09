; DESCRIPTION: Creates a purple rectangular region at (228, 95) spanning 89 by 60 pixels.
; PLAN: r0=228(x), r1=95(y), r2=89(width), r3=60(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 95
LDI r2, 89
LDI r3, 60
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
