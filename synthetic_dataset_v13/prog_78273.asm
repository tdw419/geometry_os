; DESCRIPTION: Draws a cyan circle centered at (384, 152) with radius 68.
; PLAN: r0=384(x), r1=152(y), r2=68(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 384
LDI r1, 152
LDI r2, 68
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
