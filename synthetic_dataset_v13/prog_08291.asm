; DESCRIPTION: Creates a red rectangular region at (66, 92) spanning 23 by 33 pixels.
; PLAN: r0=66(x), r1=92(y), r2=23(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 92
LDI r2, 23
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
