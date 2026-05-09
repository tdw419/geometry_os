; DESCRIPTION: Draws a cyan circle centered at (470, 215) with radius 31.
; PLAN: r0=470(x), r1=215(y), r2=31(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 470
LDI r1, 215
LDI r2, 31
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
