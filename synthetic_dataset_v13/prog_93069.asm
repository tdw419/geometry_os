; DESCRIPTION: Creates a purple rectangular region at (404, 58) spanning 17 by 93 pixels.
; PLAN: r0=404(x), r1=58(y), r2=17(width), r3=93(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 58
LDI r2, 17
LDI r3, 93
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
