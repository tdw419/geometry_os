; DESCRIPTION: Creates a black rectangular region at (372, 220) spanning 94 by 34 pixels.
; PLAN: r0=372(x), r1=220(y), r2=94(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 220
LDI r2, 94
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
