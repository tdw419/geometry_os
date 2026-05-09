; DESCRIPTION: Creates a magenta rectangular region at (408, 182) spanning 19 by 54 pixels.
; PLAN: r0=408(x), r1=182(y), r2=19(width), r3=54(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 182
LDI r2, 19
LDI r3, 54
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
