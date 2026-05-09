; DESCRIPTION: Creates a red rectangular region at (321, 111) spanning 102 by 33 pixels.
; PLAN: r0=321(x), r1=111(y), r2=102(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 111
LDI r2, 102
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
