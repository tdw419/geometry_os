; DESCRIPTION: Creates a green rectangular region at (204, 141) spanning 85 by 104 pixels.
; PLAN: r0=204(x), r1=141(y), r2=85(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 141
LDI r2, 85
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
