; DESCRIPTION: Draws a cyan circle centered at (91, 84) with radius 56.
; PLAN: r0=91(x), r1=84(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 91
LDI r1, 84
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
