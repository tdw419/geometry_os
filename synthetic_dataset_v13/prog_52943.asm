; DESCRIPTION: Creates a cyan rectangular region at (248, 163) spanning 35 by 44 pixels.
; PLAN: r0=248(x), r1=163(y), r2=35(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 248
LDI r1, 163
LDI r2, 35
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
