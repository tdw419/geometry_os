; DESCRIPTION: Creates a black rectangular region at (222, 90) spanning 27 by 22 pixels.
; PLAN: r0=222(x), r1=90(y), r2=27(width), r3=22(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 90
LDI r2, 27
LDI r3, 22
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
