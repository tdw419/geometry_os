; DESCRIPTION: Creates a purple rectangular region at (342, 100) spanning 68 by 80 pixels.
; PLAN: r0=342(x), r1=100(y), r2=68(width), r3=80(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 100
LDI r2, 68
LDI r3, 80
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
