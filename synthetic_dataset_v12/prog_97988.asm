; DESCRIPTION: Creates a yellow rectangular region at (140, 13) spanning 109 by 94 pixels.
; PLAN: r0=140(x), r1=13(y), r2=109(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 13
LDI r2, 109
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
