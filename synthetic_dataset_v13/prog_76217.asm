; DESCRIPTION: Creates a purple rectangular region at (329, 16) spanning 118 by 50 pixels.
; PLAN: r0=329(x), r1=16(y), r2=118(width), r3=50(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 16
LDI r2, 118
LDI r3, 50
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
