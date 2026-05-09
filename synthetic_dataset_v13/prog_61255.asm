; DESCRIPTION: Creates a cyan rectangular region at (370, 189) spanning 106 by 34 pixels.
; PLAN: r0=370(x), r1=189(y), r2=106(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 189
LDI r2, 106
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
