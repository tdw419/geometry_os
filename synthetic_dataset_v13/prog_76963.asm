; DESCRIPTION: Creates a black rectangular region at (122, 146) spanning 52 by 94 pixels.
; PLAN: r0=122(x), r1=146(y), r2=52(width), r3=94(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 146
LDI r2, 52
LDI r3, 94
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
