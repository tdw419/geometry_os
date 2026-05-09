; DESCRIPTION: Creates a cyan rectangular region at (373, 91) spanning 45 by 115 pixels.
; PLAN: r0=373(x), r1=91(y), r2=45(width), r3=115(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 91
LDI r2, 45
LDI r3, 115
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
