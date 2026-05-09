; DESCRIPTION: Creates a red circular shape at (416, 195) with radius 46.
; PLAN: r0=416(x), r1=195(y), r2=46(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 416
LDI r1, 195
LDI r2, 46
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
