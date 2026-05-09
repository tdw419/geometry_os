; DESCRIPTION: Creates a yellow rectangular region at (372, 66) spanning 90 by 70 pixels.
; PLAN: r0=372(x), r1=66(y), r2=90(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 66
LDI r2, 90
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
