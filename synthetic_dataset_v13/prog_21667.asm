; DESCRIPTION: Creates a yellow rectangular region at (191, 24) spanning 84 by 87 pixels.
; PLAN: r0=191(x), r1=24(y), r2=84(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 24
LDI r2, 84
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
