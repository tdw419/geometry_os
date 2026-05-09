; DESCRIPTION: Creates a purple rectangular region at (404, 78) spanning 51 by 55 pixels.
; PLAN: r0=404(x), r1=78(y), r2=51(width), r3=55(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 78
LDI r2, 51
LDI r3, 55
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
