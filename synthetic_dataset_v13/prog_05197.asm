; DESCRIPTION: Draws a cyan circle centered at (410, 222) with radius 17.
; PLAN: r0=410(x), r1=222(y), r2=17(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 410
LDI r1, 222
LDI r2, 17
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
