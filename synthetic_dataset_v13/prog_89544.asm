; DESCRIPTION: Creates a cyan rectangular region at (425, 17) spanning 38 by 99 pixels.
; PLAN: r0=425(x), r1=17(y), r2=38(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 425
LDI r1, 17
LDI r2, 38
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
