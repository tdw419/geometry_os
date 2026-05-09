; DESCRIPTION: Creates a green rectangular region at (8, 50) spanning 108 by 104 pixels.
; PLAN: r0=8(x), r1=50(y), r2=108(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 50
LDI r2, 108
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
