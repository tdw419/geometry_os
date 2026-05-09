; DESCRIPTION: Creates a cyan rectangular region at (227, 136) spanning 119 by 119 pixels.
; PLAN: r0=227(x), r1=136(y), r2=119(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 227
LDI r1, 136
LDI r2, 119
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
