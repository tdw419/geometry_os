; DESCRIPTION: Creates a red rectangular region at (94, 71) spanning 55 by 76 pixels.
; PLAN: r0=94(x), r1=71(y), r2=55(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 71
LDI r2, 55
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
