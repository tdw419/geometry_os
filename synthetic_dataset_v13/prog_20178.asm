; DESCRIPTION: Creates a cyan rectangular region at (266, 182) spanning 72 by 73 pixels.
; PLAN: r0=266(x), r1=182(y), r2=72(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 182
LDI r2, 72
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
