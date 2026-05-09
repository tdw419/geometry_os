; DESCRIPTION: Creates a yellow rectangular region at (286, 37) spanning 59 by 58 pixels.
; PLAN: r0=286(x), r1=37(y), r2=59(width), r3=58(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 37
LDI r2, 59
LDI r3, 58
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
