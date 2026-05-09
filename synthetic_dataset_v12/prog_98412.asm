; DESCRIPTION: Creates a red rectangular region at (182, 131) spanning 11 by 98 pixels.
; PLAN: r0=182(x), r1=131(y), r2=11(width), r3=98(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 131
LDI r2, 11
LDI r3, 98
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
