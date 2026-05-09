; DESCRIPTION: Draws a red circle centered at (54, 146) with radius 46.
; PLAN: r0=54(x), r1=146(y), r2=46(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 146
LDI r2, 46
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
