; DESCRIPTION: Creates a yellow rectangular region at (8, 79) spanning 38 by 65 pixels.
; PLAN: r0=8(x), r1=79(y), r2=38(width), r3=65(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 79
LDI r2, 38
LDI r3, 65
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
