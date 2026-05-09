; DESCRIPTION: Creates a cyan rectangular region at (66, 236) spanning 33 by 20 pixels.
; PLAN: r0=66(x), r1=236(y), r2=33(width), r3=20(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 236
LDI r2, 33
LDI r3, 20
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
