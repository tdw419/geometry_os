; DESCRIPTION: Creates a yellow rectangular region at (275, 219) spanning 44 by 36 pixels.
; PLAN: r0=275(x), r1=219(y), r2=44(width), r3=36(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 219
LDI r2, 44
LDI r3, 36
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
