; DESCRIPTION: Creates a red rectangular region at (274, 108) spanning 47 by 12 pixels.
; PLAN: r0=274(x), r1=108(y), r2=47(width), r3=12(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 108
LDI r2, 47
LDI r3, 12
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
