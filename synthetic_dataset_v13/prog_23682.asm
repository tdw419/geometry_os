; DESCRIPTION: Creates a purple rectangular region at (228, 70) spanning 31 by 94 pixels.
; PLAN: r0=228(x), r1=70(y), r2=31(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 228
LDI r1, 70
LDI r2, 31
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
