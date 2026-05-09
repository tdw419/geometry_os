; DESCRIPTION: Creates a yellow rectangular region at (196, 73) spanning 77 by 31 pixels.
; PLAN: r0=196(x), r1=73(y), r2=77(width), r3=31(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 73
LDI r2, 77
LDI r3, 31
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
