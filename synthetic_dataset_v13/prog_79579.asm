; DESCRIPTION: Creates a yellow rectangular region at (370, 79) spanning 33 by 21 pixels.
; PLAN: r0=370(x), r1=79(y), r2=33(width), r3=21(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 79
LDI r2, 33
LDI r3, 21
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
