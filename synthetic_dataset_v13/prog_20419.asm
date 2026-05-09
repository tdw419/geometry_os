; DESCRIPTION: Creates a cyan rectangular region at (306, 30) spanning 60 by 119 pixels.
; PLAN: r0=306(x), r1=30(y), r2=60(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 30
LDI r2, 60
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
