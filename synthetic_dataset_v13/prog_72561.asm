; DESCRIPTION: Creates a red rectangular region at (102, 212) spanning 28 by 44 pixels.
; PLAN: r0=102(x), r1=212(y), r2=28(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 212
LDI r2, 28
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
