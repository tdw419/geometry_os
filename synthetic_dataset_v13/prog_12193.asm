; DESCRIPTION: Creates a cyan rectangular region at (129, 101) spanning 22 by 45 pixels.
; PLAN: r0=129(x), r1=101(y), r2=22(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 101
LDI r2, 22
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
