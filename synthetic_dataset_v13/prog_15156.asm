; DESCRIPTION: Creates a black rectangular region at (280, 29) spanning 117 by 34 pixels.
; PLAN: r0=280(x), r1=29(y), r2=117(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 280
LDI r1, 29
LDI r2, 117
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
