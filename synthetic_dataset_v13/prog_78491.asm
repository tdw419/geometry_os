; DESCRIPTION: Creates a black rectangular region at (243, 48) spanning 31 by 101 pixels.
; PLAN: r0=243(x), r1=48(y), r2=31(width), r3=101(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 48
LDI r2, 31
LDI r3, 101
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
