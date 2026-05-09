; DESCRIPTION: Draws a cyan circle centered at (294, 150) with radius 25.
; PLAN: r0=294(x), r1=150(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 294
LDI r1, 150
LDI r2, 25
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
