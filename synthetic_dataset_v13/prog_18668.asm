; DESCRIPTION: Creates a yellow rectangular region at (384, 9) spanning 21 by 79 pixels.
; PLAN: r0=384(x), r1=9(y), r2=21(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 9
LDI r2, 21
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
