; DESCRIPTION: Creates a red rectangular region at (177, 3) spanning 90 by 98 pixels.
; PLAN: r0=177(x), r1=3(y), r2=90(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 3
LDI r2, 90
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
