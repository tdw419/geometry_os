; DESCRIPTION: Creates a red rectangular region at (219, 98) spanning 83 by 65 pixels.
; PLAN: r0=219(x), r1=98(y), r2=83(width), r3=65(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 98
LDI r2, 83
LDI r3, 65
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
