; DESCRIPTION: Creates a cyan rectangular region at (331, 65) spanning 106 by 32 pixels.
; PLAN: r0=331(x), r1=65(y), r2=106(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 65
LDI r2, 106
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
