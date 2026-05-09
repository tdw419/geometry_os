; DESCRIPTION: Creates a yellow rectangular region at (229, 4) spanning 27 by 31 pixels.
; PLAN: r0=229(x), r1=4(y), r2=27(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 4
LDI r2, 27
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
