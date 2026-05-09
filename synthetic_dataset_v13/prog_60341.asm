; DESCRIPTION: Creates a cyan rectangular region at (347, 72) spanning 70 by 33 pixels.
; PLAN: r0=347(x), r1=72(y), r2=70(width), r3=33(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 72
LDI r2, 70
LDI r3, 33
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
