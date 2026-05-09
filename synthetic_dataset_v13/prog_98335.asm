; DESCRIPTION: Draws a cyan circle centered at (168, 168) with radius 56.
; PLAN: r0=168(x), r1=168(y), r2=56(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 168
LDI r1, 168
LDI r2, 56
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
