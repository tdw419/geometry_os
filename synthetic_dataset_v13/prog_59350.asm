; DESCRIPTION: Creates a blue rectangular region at (91, 137) spanning 21 by 44 pixels.
; PLAN: r0=91(x), r1=137(y), r2=21(width), r3=44(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 137
LDI r2, 21
LDI r3, 44
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
