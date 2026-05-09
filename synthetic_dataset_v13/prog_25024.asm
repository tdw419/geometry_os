; DESCRIPTION: Creates a red rectangular region at (380, 0) spanning 74 by 106 pixels.
; PLAN: r0=380(x), r1=0(y), r2=74(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 0
LDI r2, 74
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
