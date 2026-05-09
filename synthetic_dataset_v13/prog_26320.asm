; DESCRIPTION: Creates a red rectangular region at (108, 138) spanning 21 by 17 pixels.
; PLAN: r0=108(x), r1=138(y), r2=21(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 138
LDI r2, 21
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
