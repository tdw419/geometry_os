; DESCRIPTION: Draws a cyan circle centered at (344, 149) with radius 26.
; PLAN: r0=344(x), r1=149(y), r2=26(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 344
LDI r1, 149
LDI r2, 26
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
