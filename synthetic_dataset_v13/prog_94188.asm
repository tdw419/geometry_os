; DESCRIPTION: Creates a green rectangular region at (400, 144) spanning 45 by 106 pixels.
; PLAN: r0=400(x), r1=144(y), r2=45(width), r3=106(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 400
LDI r1, 144
LDI r2, 45
LDI r3, 106
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
