; DESCRIPTION: Creates a magenta rectangular region at (410, 182) spanning 72 by 21 pixels.
; PLAN: r0=410(x), r1=182(y), r2=72(width), r3=21(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 182
LDI r2, 72
LDI r3, 21
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
