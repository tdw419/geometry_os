; DESCRIPTION: Creates a cyan rectangular region at (148, 138) spanning 73 by 99 pixels.
; PLAN: r0=148(x), r1=138(y), r2=73(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 138
LDI r2, 73
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
