; DESCRIPTION: Creates a purple rectangular region at (236, 16) spanning 85 by 95 pixels.
; PLAN: r0=236(x), r1=16(y), r2=85(width), r3=95(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 16
LDI r2, 85
LDI r3, 95
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
