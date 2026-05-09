; DESCRIPTION: Draws a cyan circle centered at (162, 146) with radius 63.
; PLAN: r0=162(x), r1=146(y), r2=63(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 162
LDI r1, 146
LDI r2, 63
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
