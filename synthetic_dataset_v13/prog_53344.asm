; DESCRIPTION: Creates a red rectangular region at (292, 182) spanning 68 by 10 pixels.
; PLAN: r0=292(x), r1=182(y), r2=68(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 182
LDI r2, 68
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
