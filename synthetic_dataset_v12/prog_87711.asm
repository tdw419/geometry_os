; DESCRIPTION: Creates a purple rectangular region at (247, 150) spanning 73 by 30 pixels.
; PLAN: r0=247(x), r1=150(y), r2=73(width), r3=30(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 150
LDI r2, 73
LDI r3, 30
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
