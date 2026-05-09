; DESCRIPTION: Creates a yellow rectangular region at (334, 168) spanning 90 by 87 pixels.
; PLAN: r0=334(x), r1=168(y), r2=90(width), r3=87(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 334
LDI r1, 168
LDI r2, 90
LDI r3, 87
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
