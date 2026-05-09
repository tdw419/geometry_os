; DESCRIPTION: Creates a yellow circular shape at (438, 146) with radius 68.
; PLAN: r0=438(x), r1=146(y), r2=68(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 438
LDI r1, 146
LDI r2, 68
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
