; DESCRIPTION: Creates a yellow rectangular region at (236, 1) spanning 37 by 27 pixels.
; PLAN: r0=236(x), r1=1(y), r2=37(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 1
LDI r2, 37
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
