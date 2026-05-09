; DESCRIPTION: Creates a yellow rectangular region at (273, 149) spanning 21 by 25 pixels.
; PLAN: r0=273(x), r1=149(y), r2=21(width), r3=25(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 273
LDI r1, 149
LDI r2, 21
LDI r3, 25
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
