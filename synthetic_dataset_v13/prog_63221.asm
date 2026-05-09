; DESCRIPTION: Creates a green rectangular region at (305, 57) spanning 102 by 31 pixels.
; PLAN: r0=305(x), r1=57(y), r2=102(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 57
LDI r2, 102
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
