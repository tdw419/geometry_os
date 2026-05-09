; DESCRIPTION: Creates a cyan rectangular region at (102, 32) spanning 34 by 73 pixels.
; PLAN: r0=102(x), r1=32(y), r2=34(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 32
LDI r2, 34
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
