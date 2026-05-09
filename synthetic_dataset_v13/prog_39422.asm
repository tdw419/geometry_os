; DESCRIPTION: Creates a cyan rectangular region at (274, 18) spanning 22 by 74 pixels.
; PLAN: r0=274(x), r1=18(y), r2=22(width), r3=74(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 18
LDI r2, 22
LDI r3, 74
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
