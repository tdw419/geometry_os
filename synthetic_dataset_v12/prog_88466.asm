; DESCRIPTION: Creates a cyan rectangular region at (216, 76) spanning 22 by 54 pixels.
; PLAN: r0=216(x), r1=76(y), r2=22(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 76
LDI r2, 22
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
