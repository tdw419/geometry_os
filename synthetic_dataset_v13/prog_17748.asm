; DESCRIPTION: Draws a cyan circle centered at (392, 66) with radius 48.
; PLAN: r0=392(x), r1=66(y), r2=48(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 392
LDI r1, 66
LDI r2, 48
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
