; DESCRIPTION: Creates a red rectangular region at (188, 191) spanning 36 by 17 pixels.
; PLAN: r0=188(x), r1=191(y), r2=36(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 191
LDI r2, 36
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
