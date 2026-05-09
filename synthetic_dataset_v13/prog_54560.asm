; DESCRIPTION: Creates a black rectangular region at (169, 86) spanning 98 by 94 pixels.
; PLAN: r0=169(x), r1=86(y), r2=98(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 169
LDI r1, 86
LDI r2, 98
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
