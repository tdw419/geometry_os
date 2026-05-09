; DESCRIPTION: Creates a cyan rectangular region at (129, 12) spanning 100 by 43 pixels.
; PLAN: r0=129(x), r1=12(y), r2=100(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 12
LDI r2, 100
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
