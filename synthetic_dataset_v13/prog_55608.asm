; DESCRIPTION: Creates a black rectangular region at (175, 146) spanning 14 by 78 pixels.
; PLAN: r0=175(x), r1=146(y), r2=14(width), r3=78(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 175
LDI r1, 146
LDI r2, 14
LDI r3, 78
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
