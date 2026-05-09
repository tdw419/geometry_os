; DESCRIPTION: Creates a cyan rectangular region at (17, 54) spanning 48 by 44 pixels.
; PLAN: r0=17(x), r1=54(y), r2=48(width), r3=44(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 54
LDI r2, 48
LDI r3, 44
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
