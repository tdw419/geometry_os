; DESCRIPTION: Creates a red rectangular region at (373, 98) spanning 83 by 60 pixels.
; PLAN: r0=373(x), r1=98(y), r2=83(width), r3=60(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 98
LDI r2, 83
LDI r3, 60
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
