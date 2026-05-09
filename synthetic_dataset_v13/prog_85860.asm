; DESCRIPTION: Creates a magenta rectangular region at (26, 182) spanning 33 by 48 pixels.
; PLAN: r0=26(x), r1=182(y), r2=33(width), r3=48(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 182
LDI r2, 33
LDI r3, 48
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
