; DESCRIPTION: Creates a yellow rectangular region at (246, 150) spanning 99 by 94 pixels.
; PLAN: r0=246(x), r1=150(y), r2=99(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 150
LDI r2, 99
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
