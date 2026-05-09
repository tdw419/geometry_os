; DESCRIPTION: Creates a cyan rectangular region at (289, 204) spanning 106 by 43 pixels.
; PLAN: r0=289(x), r1=204(y), r2=106(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 204
LDI r2, 106
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
