; DESCRIPTION: Creates a cyan rectangular region at (359, 191) spanning 112 by 44 pixels.
; PLAN: r0=359(x), r1=191(y), r2=112(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 191
LDI r2, 112
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
