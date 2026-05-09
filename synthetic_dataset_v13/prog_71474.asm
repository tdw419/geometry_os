; DESCRIPTION: Draws a white circle centered at (242, 186) with radius 38.
; PLAN: r0=242(x), r1=186(y), r2=38(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 242
LDI r1, 186
LDI r2, 38
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
HALT
