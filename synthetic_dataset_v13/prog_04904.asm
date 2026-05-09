; DESCRIPTION: Creates a yellow rectangular region at (65, 48) spanning 83 by 96 pixels.
; PLAN: r0=65(x), r1=48(y), r2=83(width), r3=96(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 48
LDI r2, 83
LDI r3, 96
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
