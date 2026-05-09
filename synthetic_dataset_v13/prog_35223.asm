; DESCRIPTION: Creates a yellow rectangular region at (21, 4) spanning 55 by 94 pixels.
; PLAN: r0=21(x), r1=4(y), r2=55(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 4
LDI r2, 55
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
