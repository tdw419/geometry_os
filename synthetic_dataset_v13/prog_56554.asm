; DESCRIPTION: Creates a cyan circular shape at (369, 135) with radius 65.
; PLAN: r0=369(x), r1=135(y), r2=65(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 369
LDI r1, 135
LDI r2, 65
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
