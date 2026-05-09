; DESCRIPTION: Creates a cyan rectangular region at (428, 182) spanning 23 by 37 pixels.
; PLAN: r0=428(x), r1=182(y), r2=23(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 428
LDI r1, 182
LDI r2, 23
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
