; DESCRIPTION: Creates a yellow rectangular region at (63, 1) spanning 79 by 49 pixels.
; PLAN: r0=63(x), r1=1(y), r2=79(width), r3=49(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 1
LDI r2, 79
LDI r3, 49
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
