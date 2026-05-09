; DESCRIPTION: Draws a cyan circle centered at (295, 97) with radius 66.
; PLAN: r0=295(x), r1=97(y), r2=66(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 295
LDI r1, 97
LDI r2, 66
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
