; DESCRIPTION: Creates a black rectangular region at (326, 46) spanning 94 by 66 pixels.
; PLAN: r0=326(x), r1=46(y), r2=94(width), r3=66(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 46
LDI r2, 94
LDI r3, 66
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
