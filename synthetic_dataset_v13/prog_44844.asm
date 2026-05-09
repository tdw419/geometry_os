; DESCRIPTION: Creates a cyan rectangular region at (289, 122) spanning 95 by 65 pixels.
; PLAN: r0=289(x), r1=122(y), r2=95(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 122
LDI r2, 95
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
