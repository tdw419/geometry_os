; DESCRIPTION: Creates a cyan rectangular region at (99, 23) spanning 55 by 92 pixels.
; PLAN: r0=99(x), r1=23(y), r2=55(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 23
LDI r2, 55
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
