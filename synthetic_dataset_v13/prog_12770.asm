; DESCRIPTION: Creates a cyan rectangular region at (43, 182) spanning 17 by 65 pixels.
; PLAN: r0=43(x), r1=182(y), r2=17(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 182
LDI r2, 17
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
