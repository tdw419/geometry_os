; DESCRIPTION: Creates a cyan rectangular region at (331, 31) spanning 70 by 113 pixels.
; PLAN: r0=331(x), r1=31(y), r2=70(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 31
LDI r2, 70
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
