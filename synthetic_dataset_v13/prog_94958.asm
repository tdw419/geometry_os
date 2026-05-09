; DESCRIPTION: Creates a yellow rectangular region at (350, 104) spanning 84 by 47 pixels.
; PLAN: r0=350(x), r1=104(y), r2=84(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 104
LDI r2, 84
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
