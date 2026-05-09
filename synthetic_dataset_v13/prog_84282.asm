; DESCRIPTION: Creates a blue rectangular region at (404, 169) spanning 96 by 10 pixels.
; PLAN: r0=404(x), r1=169(y), r2=96(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 404
LDI r1, 169
LDI r2, 96
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
