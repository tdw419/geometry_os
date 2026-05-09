; DESCRIPTION: Creates a black rectangular region at (94, 160) spanning 107 by 48 pixels.
; PLAN: r0=94(x), r1=160(y), r2=107(width), r3=48(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 160
LDI r2, 107
LDI r3, 48
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
