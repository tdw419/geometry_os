; DESCRIPTION: Creates a purple rectangular region at (404, 106) spanning 53 by 110 pixels.
; PLAN: r0=404(x), r1=106(y), r2=53(width), r3=110(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 106
LDI r2, 53
LDI r3, 110
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
