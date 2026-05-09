; DESCRIPTION: Creates a purple rectangular region at (120, 66) spanning 50 by 73 pixels.
; PLAN: r0=120(x), r1=66(y), r2=50(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 66
LDI r2, 50
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
