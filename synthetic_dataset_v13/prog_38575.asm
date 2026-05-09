; DESCRIPTION: Creates a red rectangular region at (321, 82) spanning 35 by 86 pixels.
; PLAN: r0=321(x), r1=82(y), r2=35(width), r3=86(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 82
LDI r2, 35
LDI r3, 86
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
