; DESCRIPTION: Draws a red circle centered at (470, 42) with radius 18.
; PLAN: r0=470(x), r1=42(y), r2=18(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 470
LDI r1, 42
LDI r2, 18
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
