; DESCRIPTION: Draws a cyan circle centered at (369, 154) with radius 70.
; PLAN: r0=369(x), r1=154(y), r2=70(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 369
LDI r1, 154
LDI r2, 70
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
