; DESCRIPTION: Creates a cyan rectangular region at (32, 149) spanning 110 by 58 pixels.
; PLAN: r0=32(x), r1=149(y), r2=110(width), r3=58(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 149
LDI r2, 110
LDI r3, 58
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
