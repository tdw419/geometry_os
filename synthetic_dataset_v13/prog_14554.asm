; DESCRIPTION: Creates a green rectangular region at (363, 182) spanning 18 by 61 pixels.
; PLAN: r0=363(x), r1=182(y), r2=18(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 182
LDI r2, 18
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
