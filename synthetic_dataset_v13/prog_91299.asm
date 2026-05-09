; DESCRIPTION: Creates a yellow rectangular region at (270, 57) spanning 93 by 59 pixels.
; PLAN: r0=270(x), r1=57(y), r2=93(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 57
LDI r2, 93
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
