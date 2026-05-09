; DESCRIPTION: Creates a cyan rectangular region at (401, 17) spanning 25 by 110 pixels.
; PLAN: r0=401(x), r1=17(y), r2=25(width), r3=110(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 17
LDI r2, 25
LDI r3, 110
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
