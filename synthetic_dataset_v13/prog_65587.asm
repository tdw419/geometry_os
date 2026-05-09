; DESCRIPTION: Creates a green rectangular region at (218, 5) spanning 104 by 37 pixels.
; PLAN: r0=218(x), r1=5(y), r2=104(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 5
LDI r2, 104
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
