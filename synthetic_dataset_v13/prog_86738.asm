; DESCRIPTION: Creates a yellow rectangular region at (124, 127) spanning 28 by 57 pixels.
; PLAN: r0=124(x), r1=127(y), r2=28(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 127
LDI r2, 28
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
