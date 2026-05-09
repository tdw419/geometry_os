; DESCRIPTION: Creates a cyan rectangular region at (204, 44) spanning 118 by 46 pixels.
; PLAN: r0=204(x), r1=44(y), r2=118(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 44
LDI r2, 118
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
