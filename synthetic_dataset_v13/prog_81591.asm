; DESCRIPTION: Creates a black rectangular region at (48, 11) spanning 40 by 99 pixels.
; PLAN: r0=48(x), r1=11(y), r2=40(width), r3=99(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 11
LDI r2, 40
LDI r3, 99
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
