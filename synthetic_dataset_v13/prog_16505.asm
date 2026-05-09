; DESCRIPTION: Creates a yellow rectangular region at (111, 187) spanning 23 by 57 pixels.
; PLAN: r0=111(x), r1=187(y), r2=23(width), r3=57(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 187
LDI r2, 23
LDI r3, 57
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
