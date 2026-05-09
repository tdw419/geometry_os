; DESCRIPTION: Creates a yellow rectangular region at (392, 182) spanning 73 by 61 pixels.
; PLAN: r0=392(x), r1=182(y), r2=73(width), r3=61(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 392
LDI r1, 182
LDI r2, 73
LDI r3, 61
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
