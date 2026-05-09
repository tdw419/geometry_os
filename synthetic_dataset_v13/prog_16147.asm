; DESCRIPTION: Creates a yellow rectangular region at (417, 58) spanning 65 by 59 pixels.
; PLAN: r0=417(x), r1=58(y), r2=65(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 417
LDI r1, 58
LDI r2, 65
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
