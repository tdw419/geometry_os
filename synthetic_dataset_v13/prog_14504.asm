; DESCRIPTION: Draws a cyan circle centered at (189, 154) with radius 72.
; PLAN: r0=189(x), r1=154(y), r2=72(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 189
LDI r1, 154
LDI r2, 72
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
