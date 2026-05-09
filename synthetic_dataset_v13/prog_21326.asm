; DESCRIPTION: Creates a yellow rectangular region at (218, 59) spanning 110 by 75 pixels.
; PLAN: r0=218(x), r1=59(y), r2=110(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 59
LDI r2, 110
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
