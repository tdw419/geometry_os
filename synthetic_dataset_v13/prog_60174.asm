; DESCRIPTION: Creates a cyan rectangular region at (335, 43) spanning 31 by 111 pixels.
; PLAN: r0=335(x), r1=43(y), r2=31(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 335
LDI r1, 43
LDI r2, 31
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
