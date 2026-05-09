; DESCRIPTION: Creates a cyan rectangular region at (158, 110) spanning 59 by 100 pixels.
; PLAN: r0=158(x), r1=110(y), r2=59(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 110
LDI r2, 59
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
