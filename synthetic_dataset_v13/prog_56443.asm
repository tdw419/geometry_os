; DESCRIPTION: Draws a cyan circle centered at (59, 213) with radius 10.
; PLAN: r0=59(x), r1=213(y), r2=10(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 59
LDI r1, 213
LDI r2, 10
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
