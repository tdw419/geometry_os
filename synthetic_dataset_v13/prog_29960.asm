; DESCRIPTION: Creates a yellow rectangular region at (405, 47) spanning 65 by 115 pixels.
; PLAN: r0=405(x), r1=47(y), r2=65(width), r3=115(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 47
LDI r2, 65
LDI r3, 115
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
