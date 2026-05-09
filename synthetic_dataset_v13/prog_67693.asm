; DESCRIPTION: Draws a cyan circle centered at (412, 57) with radius 54.
; PLAN: r0=412(x), r1=57(y), r2=54(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 412
LDI r1, 57
LDI r2, 54
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
