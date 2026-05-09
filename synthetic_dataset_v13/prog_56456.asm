; DESCRIPTION: Creates a yellow rectangular region at (193, 144) spanning 55 by 44 pixels.
; PLAN: r0=193(x), r1=144(y), r2=55(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 144
LDI r2, 55
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
