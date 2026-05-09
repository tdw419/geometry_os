; DESCRIPTION: Creates a white rectangular region at (108, 91) spanning 104 by 15 pixels.
; PLAN: r0=108(x), r1=91(y), r2=104(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 91
LDI r2, 104
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
