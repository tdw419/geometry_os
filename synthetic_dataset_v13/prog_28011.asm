; DESCRIPTION: Creates a purple rectangular region at (404, 172) spanning 108 by 32 pixels.
; PLAN: r0=404(x), r1=172(y), r2=108(width), r3=32(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 172
LDI r2, 108
LDI r3, 32
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
