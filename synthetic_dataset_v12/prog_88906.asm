; DESCRIPTION: Creates a cyan rectangular region at (220, 64) spanning 110 by 110 pixels.
; PLAN: r0=220(x), r1=64(y), r2=110(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 64
LDI r2, 110
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
