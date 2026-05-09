; DESCRIPTION: Creates a green rectangular region at (404, 38) spanning 52 by 106 pixels.
; PLAN: r0=404(x), r1=38(y), r2=52(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 38
LDI r2, 52
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
