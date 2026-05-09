; DESCRIPTION: Creates a yellow rectangular region at (202, 17) spanning 20 by 59 pixels.
; PLAN: r0=202(x), r1=17(y), r2=20(width), r3=59(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 17
LDI r2, 20
LDI r3, 59
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
