; DESCRIPTION: Draws a cyan circle centered at (450, 112) with radius 36.
; PLAN: r0=450(x), r1=112(y), r2=36(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 450
LDI r1, 112
LDI r2, 36
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
