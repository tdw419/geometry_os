; DESCRIPTION: Creates a black rectangular region at (161, 8) spanning 71 by 80 pixels.
; PLAN: r0=161(x), r1=8(y), r2=71(width), r3=80(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 8
LDI r2, 71
LDI r3, 80
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
