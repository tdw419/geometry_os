; DESCRIPTION: Creates a cyan rectangular region at (200, 199) spanning 49 by 16 pixels.
; PLAN: r0=200(x), r1=199(y), r2=49(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 200
LDI r1, 199
LDI r2, 49
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
