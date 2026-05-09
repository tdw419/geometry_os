; DESCRIPTION: Draws a green circle centered at (295, 206) with radius 36.
; PLAN: r0=295(x), r1=206(y), r2=36(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 295
LDI r1, 206
LDI r2, 36
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
