; DESCRIPTION: Creates a black rectangular region at (410, 184) spanning 22 by 35 pixels.
; PLAN: r0=410(x), r1=184(y), r2=22(width), r3=35(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 184
LDI r2, 22
LDI r3, 35
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
