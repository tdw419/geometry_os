; DESCRIPTION: Creates a yellow circular shape at (300, 146) with radius 60.
; PLAN: r0=300(x), r1=146(y), r2=60(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 300
LDI r1, 146
LDI r2, 60
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
