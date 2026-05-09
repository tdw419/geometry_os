; DESCRIPTION: Creates a cyan rectangular region at (163, 166) spanning 38 by 78 pixels.
; PLAN: r0=163(x), r1=166(y), r2=38(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 166
LDI r2, 38
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
