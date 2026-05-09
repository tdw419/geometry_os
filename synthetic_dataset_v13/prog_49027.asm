; DESCRIPTION: Creates a green rectangular region at (346, 182) spanning 84 by 49 pixels.
; PLAN: r0=346(x), r1=182(y), r2=84(width), r3=49(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 182
LDI r2, 84
LDI r3, 49
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
