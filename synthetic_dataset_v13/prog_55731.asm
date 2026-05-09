; DESCRIPTION: Creates a cyan rectangular region at (409, 182) spanning 66 by 52 pixels.
; PLAN: r0=409(x), r1=182(y), r2=66(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 409
LDI r1, 182
LDI r2, 66
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
