; DESCRIPTION: Creates a red rectangular region at (279, 139) spanning 58 by 66 pixels.
; PLAN: r0=279(x), r1=139(y), r2=58(width), r3=66(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 139
LDI r2, 58
LDI r3, 66
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
