; DESCRIPTION: Creates a green circular shape at (202, 143) with radius 54.
; PLAN: r0=202(x), r1=143(y), r2=54(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 202
LDI r1, 143
LDI r2, 54
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
