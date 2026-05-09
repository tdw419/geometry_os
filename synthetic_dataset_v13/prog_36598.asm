; DESCRIPTION: Creates a cyan rectangular region at (305, 23) spanning 31 by 63 pixels.
; PLAN: r0=305(x), r1=23(y), r2=31(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 23
LDI r2, 31
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
