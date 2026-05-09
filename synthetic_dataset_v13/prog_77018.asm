; DESCRIPTION: Creates a cyan rectangular region at (393, 154) spanning 99 by 31 pixels.
; PLAN: r0=393(x), r1=154(y), r2=99(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 154
LDI r2, 99
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
