; DESCRIPTION: Creates a red rectangular region at (202, 153) spanning 102 by 47 pixels.
; PLAN: r0=202(x), r1=153(y), r2=102(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 153
LDI r2, 102
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
