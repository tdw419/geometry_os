; DESCRIPTION: Creates a yellow rectangular region at (186, 191) spanning 96 by 47 pixels.
; PLAN: r0=186(x), r1=191(y), r2=96(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 191
LDI r2, 96
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
