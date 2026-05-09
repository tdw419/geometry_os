; DESCRIPTION: Creates a red rectangular region at (241, 177) spanning 77 by 57 pixels.
; PLAN: r0=241(x), r1=177(y), r2=77(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 177
LDI r2, 77
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
