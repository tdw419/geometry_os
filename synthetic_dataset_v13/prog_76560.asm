; DESCRIPTION: Creates a yellow rectangular region at (447, 17) spanning 57 by 44 pixels.
; PLAN: r0=447(x), r1=17(y), r2=57(width), r3=44(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 447
LDI r1, 17
LDI r2, 57
LDI r3, 44
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
