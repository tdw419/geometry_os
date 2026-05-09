; DESCRIPTION: Draws a cyan circle centered at (180, 142) with radius 27.
; PLAN: r0=180(x), r1=142(y), r2=27(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 180
LDI r1, 142
LDI r2, 27
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
