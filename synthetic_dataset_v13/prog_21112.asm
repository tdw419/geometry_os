; DESCRIPTION: Creates a yellow rectangular region at (259, 98) spanning 65 by 37 pixels.
; PLAN: r0=259(x), r1=98(y), r2=65(width), r3=37(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 98
LDI r2, 65
LDI r3, 37
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
