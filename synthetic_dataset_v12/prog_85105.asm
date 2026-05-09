; DESCRIPTION: Creates a cyan rectangular region at (212, 90) spanning 78 by 65 pixels.
; PLAN: r0=212(x), r1=90(y), r2=78(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 212
LDI r1, 90
LDI r2, 78
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
