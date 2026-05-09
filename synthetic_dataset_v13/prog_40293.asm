; DESCRIPTION: Creates a yellow rectangular region at (376, 132) spanning 70 by 94 pixels.
; PLAN: r0=376(x), r1=132(y), r2=70(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 132
LDI r2, 70
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
