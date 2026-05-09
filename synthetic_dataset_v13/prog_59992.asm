; DESCRIPTION: Creates a yellow rectangular region at (65, 20) spanning 24 by 79 pixels.
; PLAN: r0=65(x), r1=20(y), r2=24(width), r3=79(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 20
LDI r2, 24
LDI r3, 79
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
